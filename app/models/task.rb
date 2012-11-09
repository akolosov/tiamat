class Task < ActiveRecord::Base
  resourcify

  belongs_to  :parent,
              :class_name  => "Task",
              :foreign_key => "parent_id"

  has_many    :childs,
              :class_name  => "Task",
              :foreign_key => "parent_id",
              :order       => "name",
              :dependent   => :destroy

  has_many    :tag_task_relations
  has_many    :tags, :through => :tag_task_relations

  belongs_to  :task_context

  belongs_to  :user

  belongs_to  :project

  belongs_to  :folder

  scope :done, where(:is_done => true)
  scope :undone, where(:is_done => false)
  scope :recent, lambda { where('created_at >= ?', Time.now - 1.week) }
  scope :tomorrow, lambda { where('due_day = ?', Date.tomorrow) }
  scope :today, lambda { where('due_day = ?', Date.today) }
  scope :yesterday, lambda { where('due_day = ?', Date.yesterday) }

end
