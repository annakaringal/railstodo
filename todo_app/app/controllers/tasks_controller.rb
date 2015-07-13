class TasksController < ApplicationController
  def new
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
    @task = Task.find_by(id: params[:id])
  end

  def update
    Task.find_by(id: params[:id]).update(task_params)
    redirect_to :root
  end

  def destroy
    Task.find_by(id: params[:id]).destroy
    redirect_to :root
  end

  private
  def task_params
    params.require(:task).permit(:description, :list_id)
  end
end
