class MarvelApi
  MARVEL_ENDPOINT = 'https://gateway.marvel.com/v1/public'.freeze

  attr_reader :current_timestamp

  def initialize
    @current_timestamp = Time.now.to_i
  end

  def get_all_characters
    make_call "#{MARVEL_ENDPOINT}/characters"
  end

  def get_character(character_id)
    make_call "#{MARVEL_ENDPOINT}/characters/#{character_id}"
  end

  private

  def make_call(url)
    resp = Faraday.new(url: url).get do |req|
      req.params['apikey'] = public_key
      req.params['ts'] = current_timestamp
      req.params['hash'] = hash
    end
    resp.body
  end

  def hash
    digest = Digest::MD5.new
    digest.update "#{current_timestamp}#{private_key}#{public_key}"
    digest.hexdigest
  end

  def private_key
    Rails.application.secrets.marvel_api_private_key
  end

  def public_key
    Rails.application.secrets.marvel_api_public_key
  end
end
