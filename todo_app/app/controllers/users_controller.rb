class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # You need to log your user in now (like I've added below on line 11) that you've created one, otherwise the rest of your site is inaccessible due to the require_logged_in method. Note that it should be session[:user_id] and not session[:id] - be specific.
      session[:user_id] = @user.id

      redirect_to @user
    else
      # What should happen if the user doesn't save?
    end
  end

  def show
    require_logged_in
    @user = User.find_by(id: params[:id])
    @lists = @user.lists
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
