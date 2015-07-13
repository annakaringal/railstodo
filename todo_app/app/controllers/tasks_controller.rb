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
    end
  end

  def edit
    require_logged_in
    @task = Task.find_by(id: params[:id])
  end

  def update
    task = Task.find_by(id: params[:id]).update(task_params)
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
