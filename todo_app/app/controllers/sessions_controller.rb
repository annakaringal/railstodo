class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      # session[:id] = @user.id
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_path
    end
  end

  def destroy
    # session[:id] = nil
    session[:user_id] = nil
    redirect_to :root
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
