class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:show, :edit, :update, :destroy]
# before_action :authenticate_user!, except: [:new]
  # GET /todolists
  # GET /todolists.json
  def index
    @todolists = Todolist.all
  end

  # GET /todolists/1
  # GET /todolists/1.json
  def show
  end

  # GET /todolists/new
  def new
    @todolist = Todolist.new     
  end

  # GET /todolists/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /todolists
  # POST /todolists.json
  def create
    @todolist = current_user.todolists.create(todolist_params)   
    respond_to do |format|
     format.js 
    end
  end

  # PATCH/PUT /todolists/1
  # PATCH/PUT /todolists/1.json
  def update
    respond_to do |format|
      if @todolist.update(todolist_params)
        format.js
      else
        format.html { render :edit }
        format.json { respond_with_bip(@todolist) }
      end
    end
  end

  def sort
    params[:order].each do |key,value|
      Todolist.find(value[:id]).update_attribute(:priority,value[:position])
    end
    head :ok
  end

  # DELETE /todolists/1
  # DELETE /todolists/1.json
  def destroy
    @todolist.destroy
    respond_to do |format|
     format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todolist
      @todolist = Todolist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todolist_params
      params.require(:todolist).permit(:user_id, :name, :priority)
    end
end
