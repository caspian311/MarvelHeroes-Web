class ApiAccessesController < ApplicationController
  def new
    @api_access = ApiAccess.new
  end

  def create
    ApiAccess.create_with_key! api_access_params
    redirect_to home_index_path
  rescue
    redirect_to new_api_access_path, flash: { error: 'Both public and private keys are required to create an API key' }
  end

  private

  def api_access_params
    {
      user: current_user,
      public_key: public_key,
      private_key: private_key
    }
  end

  def api_access
    params.require :api_access
  end

  def public_key
    api_access.require :public_key
  end

  def private_key
    api_access.require :private_key
  end
end
