class UsersController < ApplicationController
  skip_filter :authenticate

  def new
    @user = User.new
  end

  def create
    User.create! user_params

    redirect_to :home_path
  end

  private

  def user_params
    params.require(:user).permit :email, :password
  end
end
