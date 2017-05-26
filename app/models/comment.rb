class Comment < ApplicationRecord
  belongs_to :task
  has_many :uploaders, :dependent => :destroy
end
