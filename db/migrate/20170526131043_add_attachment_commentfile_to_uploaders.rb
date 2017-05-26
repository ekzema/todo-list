class AddAttachmentCommentfileToUploaders < ActiveRecord::Migration[5.1]
  def self.up
    change_table :uploaders do |t|
      t.attachment :commentfile
    end
  end

  def self.down
    remove_attachment :uploaders, :commentfile
  end
end
