class CharacterService
  def all_characters
  end

  def fetch(character_id)
    Character.find_or_create_by!(character_id: character_id) do |character|
      body = JSON.parse(marvel_api.get_character character_id)
      character.update_attributes body: body
    end.body
  end

  private

  def marvel_api
    MarvelApi.new
  end
end
