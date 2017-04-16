class Api::CharactersController < Api::ApiBaseController
  before_action :token_auth

  def index
    render json: CharacterService.new.all_characters
  end

  def show
    render json: CharacterService.new.fetch(params[:id])
  end

  private

  def token_auth
    authenticate_or_request_with_http_token do |token, _|
      ApiAccess.find_by(api_key: token).present?
    end
  end
end
