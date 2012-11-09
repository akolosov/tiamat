class User < ActiveRecord::Base
  rolify

  attr_accessible :username, :email, :password, :password_confirmation, :providers_attributes

  alias_attribute :name, :username

  has_many :providers, :class_name => "UserProvider", :dependent => :destroy

  has_many :folders, :dependent => :destroy

  has_many :projects, :dependent => :destroy

  has_many :tasks, :dependent => :destroy

  has_many :task_contexts, :dependent => :destroy

  has_many :tags, :dependent => :destroy

  accepts_nested_attributes_for :providers

  authenticates_with_sorcery!

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password

  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

end
