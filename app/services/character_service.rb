class CharacterService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def all_characters
    JSON.parse(marvel_api.get_all_characters)
  end

  def fetch(character_id)
    JSON.parse(marvel_api.get_character(character_id))
  end

  private

  def marvel_api
    MarvelApi.new user.api_access.public_key, user.api_access.private_key
  end
end
