class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
  	@todolist = Todolist.new
    @task = Task.new
  end
end
