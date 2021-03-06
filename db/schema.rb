# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121108080056) do

  create_table "folders", :force => true do |t|
    t.integer "parent_id"
    t.integer "user_id"
    t.string  "name",                           :null => false
    t.text    "description"
    t.boolean "is_default",  :default => false
    t.boolean "is_system",   :default => false
  end

  create_table "projects", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "user_id"
    t.string   "name",                           :null => false
    t.text     "description"
    t.date     "due_day"
    t.boolean  "is_closed",   :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tag_task_relations", :force => true do |t|
    t.integer "tag_id"
    t.integer "task_id"
  end

  create_table "tags", :force => true do |t|
    t.integer "user_id"
    t.string  "name",    :null => false
  end

  create_table "task_contexts", :force => true do |t|
    t.integer "user_id"
    t.string  "name",        :null => false
    t.text    "description"
  end

  create_table "tasks", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "folder_id",                          :null => false
    t.integer  "task_context_id"
    t.string   "name",                               :null => false
    t.text     "description"
    t.date     "due_day"
    t.boolean  "is_done",         :default => false
    t.boolean  "is_important",    :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "user_providers", :force => true do |t|
    t.integer "user_id",  :null => false
    t.string  "provider", :null => false
    t.string  "uid",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                                       :null => false
    t.string   "email",                                          :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "activation_state"
    t.string   "activation_code"
    t.datetime "activation_code_expires_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.integer  "failed_logins_count",             :default => 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.string   "session"
  end

  add_index "users", ["activation_code"], :name => "index_users_on_activation_code"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_logout_at", "last_activity_at"], :name => "index_users_on_last_logout_at_and_last_activity_at"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
