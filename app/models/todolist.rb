class Todolist < ApplicationRecord
	belongs_to :user
	validates :name, :presence => {message: 'Заголовок не можеть быть пустым!'}
end
