class Api::CharactersController < Api::ApiBaseController
  after_action :log_usage

  def index
    render json: CharacterService.new.all_characters
  end

  def show
    render json: CharacterService.new.fetch(params[:id])
  end

  private

  def log_usage
    Usage.create! user: current_user, request: request.original_url, response: response.status
  end
end
