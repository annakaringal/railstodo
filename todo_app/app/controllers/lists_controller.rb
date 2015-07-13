class ListsController < ApplicationController
  def new
    require_logged_in
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
    end
  end

  def show
    require_logged_in
    @list = List.find_by(id: params[:id])
    @tasks = @list.tasks
  end

  def edit
    require_logged_in
    @list = List.find_by(id: params[:id])
  end

  def update
    List.find_by(id: params[:id]).update(list_params)
    redirect_to :root
  end

  def destroy
    List.find_by(id: params[:id]).destroy
    redirect_to :root
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
