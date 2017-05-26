class AddAttachmentUploaderToComments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :comments do |t|
      t.attachment :uploader
    end
  end

  def self.down
    remove_attachment :comments, :uploader
  end
end
