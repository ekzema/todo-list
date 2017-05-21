class Todolist < ApplicationRecord
	belongs_to :user
	has_many :tasks, :dependent => :destroy
	validates :name, :presence => {message: 'Заголовок не можеть быть пустым!'}
end
