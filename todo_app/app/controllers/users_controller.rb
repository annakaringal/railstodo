class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
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
