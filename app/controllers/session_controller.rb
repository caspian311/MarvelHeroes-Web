class SessionController < ApplicationController
  skip_filter :authenticate

  def new
  end

  def create
    if good_login
      session[:email] = user_params[:email]
      redirect_to home_index_path
    else
      flash[:login] = 'Invalid credentials'
      redirect_to new_session_path 
    end
  end

  private

  def good_login
    User.find_by user_params
  end

  def user_params
    params.permit :email, :password
  end
end
