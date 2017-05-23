class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :comment
      t.date :to_perform
      t.integer :completed, default: 0
      t.integer :priority
      t.string :todolist_id

      t.timestamps
    end
  end
end
