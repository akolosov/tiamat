class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :parent_id
      t.references :user
      t.references :project
      t.references :folder, :null => false
      t.references :task_context
      t.string :name, :null => false
      t.text :description
      t.date :due_day
      t.boolean :is_done, :default => false
      t.boolean :is_important, :default => false

      t.timestamps
    end
  end
end
