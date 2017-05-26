class Todolist < ApplicationRecord
	belongs_to :user
	has_many :tasks, :dependent => :destroy
	validates :name, :presence => {message: 'Заголовок не можеть быть пустым!'}
	 default_scope { order("priority ASC", created_at: :desc) }
end
