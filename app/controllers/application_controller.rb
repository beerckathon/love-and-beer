class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def hello
    render html: 'hello, world!'
  end

  private

  def logged_in_user
    return if logged_in?
    
    redirect_to login_url
  end
end
