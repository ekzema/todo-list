class CreateTodolists < ActiveRecord::Migration[5.1]
  def change
    create_table :todolists do |t|
      t.integer :user_id
      t.string :name
      t.integer :priority

      t.timestamps
    end
  end
end
