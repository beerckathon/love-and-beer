class UsersController < ApplicationController
  def show
    @user = User.find_by(login_id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to user_path(@user.login_id)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :login_id, :password, :password_confirm)
  end
end
