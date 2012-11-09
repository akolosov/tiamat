class Project < ActiveRecord::Base
  resourcify

  belongs_to  :user

  belongs_to  :parent,
              :class_name  => "Project",
              :foreign_key => "parent_id"

  has_many    :childs,
              :class_name  => "Project",
              :foreign_key => "parent_id",
              :order       => "name",
              :dependent   => :destroy

  has_many    :tasks

  scope :closed, where(:is_closed => true)
  scope :unclosed, where(:is_closed => false)

end
