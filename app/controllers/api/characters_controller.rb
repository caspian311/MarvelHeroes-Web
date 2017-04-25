module Api
  class CharactersController < Api::ApiBaseController
    def index
      render json: CharacterService.new.all_characters
    end

    def show
      render json: CharacterService.new.fetch(params[:id])
    end
  end
end
