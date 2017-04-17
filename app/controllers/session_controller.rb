class SessionController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    if good_login
      session[:email] = email_param[:email]
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
    User.find_by(email_param).try(:authenticate, password_param[:password])
  end

  def email_param
    params[:session].permit :email
  end

  def password_param
    params[:session].permit :password
  end
end
