require 'rails_helper'
RSpec.describe Todolist, type: :model do
it "product attributes must not be empty" do
	todolist = Todolist.new(name: '')
	todolist.valid?
	todolist.errors[:name].should_not be_empty
end
end
