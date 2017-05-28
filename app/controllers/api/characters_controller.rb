module Api
  class CharactersController < Api::ApiBaseController
    def index
      render json: character_service.all_characters
    end

    def show
      render json: character_service.fetch(params[:id])
    end

    private

    def character_service
      CharacterService.new current_user
    end
  end
end
