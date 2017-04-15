class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate

  helper_method :current_user

  def authenticate
    redirect_to new_session_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by_email session[:email]
  end
end
