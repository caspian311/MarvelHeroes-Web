class UsersController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    create_user
    session[:email] = user_params[:email]
    redirect_to home_index_path
  rescue StandardError => e
    redirect_to new_user_path, flash: { error: e.message }
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password
  end

  def create_user
    User.create_with_api_key! user_params
  end
end
