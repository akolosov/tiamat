class TaskContext < ActiveRecord::Base
  resourcify

  has_many    :tasks

  belongs_to  :user
end