module Api
  class ApiBaseController < ActionController::Base
    before_action :api_authenticate
    attr_reader :current_user
    after_action :log_usage

    def api_authenticate
      authenticate_or_request_with_http_token do |token, _|
        api_access = ApiAccess.find_by(api_key: token)
        @current_user = api_access&.user
        api_access.present?
      end
    end

    private

    def log_usage
      Usage.create! user: current_user, request: request.original_url, response: response.status
    end
  end
end
