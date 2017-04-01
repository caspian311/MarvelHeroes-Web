class Api::ApiBaseController < ActionController::Base
  before_action :api_authenticate

  def api_authenticate
    head :unauthorized unless authenticated?
  end

  def authenticated?
    true
  end
end
