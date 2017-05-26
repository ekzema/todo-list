class Uploader < ApplicationRecord
  belongs_to :comment
  has_attached_file :commentfile
  do_not_validate_attachment_file_type :commentfile
end
