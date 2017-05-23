class Task < ApplicationRecord
  belongs_to :todolist

  validates_presence_of :title

  default_scope { order("priority ASC", created_at: :asc) }
end
