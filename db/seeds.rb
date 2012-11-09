# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


class Integer
  def to_b
    !self.zero?
  end
end

# Roles
Role.create([ { :name => 'user' } ], :without_protection => true)

# Users
user = User.create :username => 'user', :email => 'user@test.com', :password => 'user', :password_confirmation => 'user'
user.save
user.add_role :user
# Folders
user.folders.new(:name => "Inbox", :user => user, :description => "Inbox for all tasks", :is_system => true, :is_default => true).save()
user.folders.new(:name => "Today", :user => user, :description => "Today tasks", :is_system => true, :is_default => false).save()
user.folders.new(:name => "Planed", :user => user, :description => "Planed tasks", :is_system => true, :is_default => false).save()
user.folders.new(:name => "Someday", :user => user, :description => "Maybe/Someday tasks", :is_system => true, :is_default => false).save()
user.folders.new(:name => "Important", :user => user, :description => "Important today tasks", :parent => Folder.find(2), :is_system => true, :is_default => false).save()

# Contexts
user.task_contexts.new(:name => "@Home", :user => user, :description => "At home tasks").save()
user.task_contexts.new(:name => "@Office", :user => user, :description => "At office tasks").save()
user.task_contexts.new(:name => "@School", :user => user, :description => "At school tasks").save()
user.task_contexts.new(:name => "@Shop", :user => user, :description => "At shop tasks").save()

5.times do |i|
  Folder.new(:name => "Custom #{i.to_s}",
	     :description => "Custom user folder #{i.to_s}",
	     :parent => Folder.find(Random.rand(5)+1),
	     :user => user,
	     :is_system => false,
	     :is_default => false
	    ).save()
end

# Tags
10.times do |i|
  # Tags
  Tag.new(:name => "Tag #{i.to_s}", :user => user).save()
end

5.times do |i|
  # Projects
  Project.new(:name => "Project #{i.to_s}", :user => user, :description => "Simple test project #{i.to_s}").save()
end

5.times do |i|
  # SubProjects
  Project.new(:name => "SubProject #{i.to_s}", :user => user, :description => "Simple test subproject #{i.to_s}", :parent => Project.find(Random.rand(5)+1)).save()
end

20.times do |i|
  # Tasks
  Task.new( :name => "Task #{i.to_s}",
	    :description => "Simple test task #{i.to_s}",
	    :project => Project.find(Random.rand(10)+1),
	    :folder => Folder.find(Random.rand(10)+1),
	    :due_day => Date.today()+Random.rand(i+1).days(),
	    :task_context => TaskContext.find(Random.rand(4)+1),
	    :user => user,
	    :tag_ids => [Random.rand(10)+1, Random.rand(10)+1, Random.rand(10)+1],
	    :is_done => Random.rand(2).to_b
	  ).save()
end

10.times do |i|
  # SubTasks
  parent = Task.find(Random.rand(20)+1)
  Task.new( :name => "SubTask #{i.to_s}",
	    :description => "Simple test subtask #{i.to_s}",
	    :parent => parent,
	    :project => parent.project,
	    :folder => parent.folder,
	    :user => user,
	    :task_context => parent.task_context,
	    :due_day => Date.today()+Random.rand(i+1).days(),
	    :tag_ids => [Random.rand(10)+1, Random.rand(10)+1, Random.rand(10)+1],
	    :is_done => Random.rand(2).to_b
	  ).save()
end

20.times do |i|
  # SubTasks
  parent = Task.find(Random.rand(30)+1)
  Task.new( :name => "SubTask #{(i+10).to_s}",
	    :description => "Simple test subtask #{(i+10).to_s}",
	    :parent => parent,
	    :project => parent.project,
	    :folder => parent.folder,
	    :user => user,
	    :task_context => parent.task_context,
	    :due_day => Date.today()+Random.rand(i+1).days(),
	    :tag_ids => [Random.rand(10)+1, Random.rand(10)+1, Random.rand(10)+1],
	    :is_done => Random.rand(2).to_b
	  ).save()
end

30.times do |i|
  # SubTasks
  parent = Task.find(Random.rand(50)+1)
  Task.new( :name => "SubTask #{(i+30).to_s}",
	    :description => "Simple test subtask #{(i+30).to_s}",
	    :parent => parent,
	    :project => parent.project,
	    :folder => parent.folder,
	    :user => user,
	    :task_context => parent.task_context,
	    :due_day => Date.today()+Random.rand(i+1).days(),
	    :tag_ids => [Random.rand(10)+1, Random.rand(10)+1, Random.rand(10)+1],
	    :is_done => Random.rand(2).to_b
	  ).save()
end
