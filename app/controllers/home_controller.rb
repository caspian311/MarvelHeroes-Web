class HomeController < ApplicationController
  def index
    @api_key = '123'# current_user.api_access.api_key
  end
end
