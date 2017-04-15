class HomeController < ApplicationController
  def index
    @api_key = current_user.api_access.api_key
  end
end
