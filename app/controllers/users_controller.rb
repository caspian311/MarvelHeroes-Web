class UsersController < ApplicationController
  skip_before_action :authenticate

  def new
    @user = User.new
  end

  def create
    User.create! user_params
    session[:email] = user_params[:email]
    redirect_to home_index_path
  rescue
    redirect_to new_user_path, flash: { error: 'Something went wrong' }
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password
  end
end
