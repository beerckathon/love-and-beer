class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(login_id: params[:session][:login_id])
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user_path(user.login_id)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
