class UsersController < ApplicationController
  skip_filter :authenticate

  def new
    @user = User.new
  end

  def create
    begin
      User.create! user_params
      render json: { redirect_to: home_index_path }
    rescue
      render json: { error: 'Email is not available' }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :password
  end
end
