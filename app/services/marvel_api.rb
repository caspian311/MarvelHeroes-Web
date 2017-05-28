class MarvelApi
  MARVEL_ENDPOINT = 'https://gateway.marvel.com/v1/public'.freeze

  attr_reader :current_timestamp, :public_key, :private_key

  def initialize(public_key, private_key)
    @current_timestamp = Time.now.to_i
    @public_key = public_key
    @private_key = private_key
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
    raise "Error: #{resp.status}" unless resp.success?
    resp.body
  end

  def hash
    digest = Digest::MD5.new
    digest.update "#{current_timestamp}#{private_key}#{public_key}"
    digest.hexdigest
  end
end
