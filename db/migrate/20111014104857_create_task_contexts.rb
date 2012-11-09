class CreateTaskContexts < ActiveRecord::Migration
  def change
    create_table :task_contexts do |t|
      t.references :user
      t.string :name, :null => false
      t.text :description
    end
  end
end
