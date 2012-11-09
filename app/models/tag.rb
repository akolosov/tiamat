class Tag < ActiveRecord::Base
  resourcify

  belongs_to  :user

  has_many    :tag_task_relations
  has_many    :tasks, :through => :tag_task_relations 

end
