module Api
  class ApiBaseController < ActionController::Base
    before_action :api_authenticate
    attr_reader :current_user

    def api_authenticate
      authenticate_or_request_with_http_token do |token, _|
        api_access = ApiAccess.find_by(api_key: token)
        @current_user = api_access&.user
        api_access.present?
      end
    end
  end
end
