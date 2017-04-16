class HomeController < ApplicationController
  def index
    @api_key = current_user.api_key
  end
end
