class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
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
    @list = List.find_by(id: params[:id])
    @tasks = @list.tasks
  end

  def edit
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
