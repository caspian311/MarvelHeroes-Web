class SessionController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    if good_login
      session[:email] = user_params[:email]
      redirect_to home_index_path
    else
      redirect_to new_session_path, flash: { error: 'Invalid credentials' }
    end
  end

  def destroy
    session[:email] = nil
    redirect_to new_session_path
  end

  private

  def good_login
    User.find_by user_params
  end

  def user_params
    params[:session].permit :email, :password
  end
end

