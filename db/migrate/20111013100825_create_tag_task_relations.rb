class CreateTagTaskRelations < ActiveRecord::Migration
  def change
    create_table :tag_task_relations do |t|
      t.references :tag
      t.references :task
    end
  end
end
