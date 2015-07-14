class TasksController < ApplicationController
  def new
    require_logged_in
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to list_path(@task.list_id)
    else
      # else what?
    end
  end

  def edit
    require_logged_in
    @task = Task.find_by(id: params[:id])
  end

  def update
    # task = Task.find_by(id: params[:id]).update(task_params)
    # This gives an error - the variable "task" that you're calling ".list_id" on has the value of "true" instead of a task object. Look at the return value of what you're assigning to "task" on line 21. You should do the update first, then the save, on separate lines so you can have a conditional that checks if task is nil. Currently if task is nil, you don't have any kind of error handling.

    redirect_to list_path(task.list_id)
  end

  def destroy
    task = Task.find_by(id: params[:id])
    list_id = task.list_id
    task.destroy
    redirect_to list_path(list_id)
  end

  private
  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end
