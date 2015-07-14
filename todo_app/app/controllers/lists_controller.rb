class ListsController < ApplicationController
  def new
    require_logged_in
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # @list.user_id = session[:id]
    @list.user_id = session[:user_id]

    if @list.save
      # Be consistent - I like how you handle passing in the session user in the destroy action, you could do that here as well.
      redirect_to user_path(@list.user_id)
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
    # Feels a little off to redirect to root after updating my list name. As a user, I want to see that it changed.
    redirect_to :root
  end

  def destroy
    List.find_by(id: params[:id]).destroy
    # redirect_to user_path(session[:id])
    redirect_to user_path(session[:user_id])
  end

  private
  def list_params
    params.require(:list).permit(:name)#, :user_id)
    # You're assigning the user_id to the list on line 10, so no need to include it here.
  end
end
