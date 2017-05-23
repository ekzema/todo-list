class TasksController < ApplicationController

  def create
    @todolist = Todolist.find(params[:todolist_id])
    @task = @todolist.tasks.new(task_params)
    @task.save

    respond_to do |format|

      format.js
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      @task.update(task_params)
      format.js
    end
  end

  def check
    @task = Task.find(params[:id])
    if @task.completed.zero?
      @task.update_attribute(:completed, 1)
    else
      @task.update_attribute(:completed, 0)
    end
    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:order].each do |key,value|
      Task.find(value[:id]).update_attribute(:priority,value[:position])
    end
    head :ok
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    respond_to do |format|
      format.js
    end
  end



  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:todolist_id, :title, :priority, :comment, :to_perform)
  end

end
