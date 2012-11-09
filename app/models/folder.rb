class Folder < ActiveRecord::Base
  resourcify

  belongs_to  :user

  belongs_to  :parent,
              :class_name  => "Folder",
              :foreign_key => "parent_id"

  has_many    :childs,
              :class_name  => "Folder",
              :foreign_key => "parent_id",
              :order       => "name",
              :dependent   => :destroy

  has_many    :tasks

end
