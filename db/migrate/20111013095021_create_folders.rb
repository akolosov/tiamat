class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.integer :parent_id
      t.references :user
      t.string :name, :null => false
      t.text :description
      t.boolean :is_default, :default => false
      t.boolean :is_system, :default => false
    end
  end
end
