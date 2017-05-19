class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
  	@todolist = Todolist.new   
  end
end
