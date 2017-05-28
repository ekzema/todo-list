class Uploader < ApplicationRecord
  belongs_to :comment
  has_attached_file :commentfile

end
