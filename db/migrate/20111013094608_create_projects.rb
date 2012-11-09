class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :parent_id
      t.references :user
      t.string :name, :null => false
      t.text :description
      t.date :due_day
      t.boolean :is_closed, :default => false

      t.timestamps
    end
  end
end
