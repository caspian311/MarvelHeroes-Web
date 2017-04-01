class SessionController < ApplicationController
  skip_filter :authenticate

  def new
  end

  def create
    if good_login
      session[:email] = user_params[:email]
      render json: { redirect_url: home_index_path }
    else
      render json: { error: 'Invalid credentials' }, status: 401
    end
  end

  private

  def good_login
    User.find_by user_params
  end

  def user_params
    params[:session].permit :email, :password
  end
end
