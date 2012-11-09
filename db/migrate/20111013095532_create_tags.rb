class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :user
      t.string :name, :null => false
    end
  end
end
