class SessionController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    if valid_credentails?
      session[:email] = email
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

  def valid_credentails?
    User.find_by_email(email).try(:authenticate, password)
  end

  def email
    params[:session][:email]
  end

  def password
    params[:session][:password]
  end
end
