class HomeController < ApplicationController
  before_action :ensure_has_api_key

  def index
    @api_key = current_user.api_key
    @api_access_id = current_user.api_access.id
  end

  private

  def ensure_has_api_key
    redirect_to new_api_access_path unless current_user.api_access.present?
  end
end
