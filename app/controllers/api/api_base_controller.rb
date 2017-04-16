module Api
  class ApiBaseController < ActionController::Base
    before_action :api_authenticate

    def api_authenticate
      authenticate_or_request_with_http_token do |token, _|
        ApiAccess.find_by(api_key: token).present?
      end
    end
  end
end
