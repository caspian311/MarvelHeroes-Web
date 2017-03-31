class Api::CharactersController < Api::ApiBaseController
  def index
    render json: CharacterService.new.all_character
  end

  def show
    render json: CharacterService.new.fetch(params[:id])
  end
end
