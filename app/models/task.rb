class Task < ApplicationRecord
  belongs_to :todolist
  has_many :comments, :dependent => :destroy
  validates_presence_of :title

  default_scope { order("priority ASC", created_at: :asc) }
end
