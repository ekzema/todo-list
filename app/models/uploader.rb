class Uploader < ApplicationRecord
  belongs_to :comment
  has_attached_file :commentfile
do_not_validate_attachment_file_type :commentfile

has_attached_file :commentfile,
  :storage => :cloudinary,
  :path => ':id/:style/:filename',
  :cloudinary_credentials => Rails.root.join("config/cloudinary.yml")
end
