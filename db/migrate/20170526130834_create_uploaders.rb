class CreateUploaders < ActiveRecord::Migration[5.1]
  def change
    create_table :uploaders do |t|
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
