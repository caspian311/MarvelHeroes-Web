describe MarvelApi do
  let(:expected_body){ 'expected payload' }
  let(:public_key){ Rails.application.secrets.marvel_api_public_key }

  describe '#get_all_characters' do
    before do
      stub_request(:get, 'https://gateway.marvel.com/v1/public/characters')
        .with(query: hash_including({
          apikey: public_key
        })) 
        .to_return(:status => 200, :body => expected_body, :headers => {})
    end

    it 'makes outside calls' do
      characters = subject.get_all_characters

      expect(characters).to eq(expected_body)
    end
  end

  describe '#get_all_characters' do
    let(:character_id){ 1009368 }

    before do
      stub_request(:get, "https://gateway.marvel.com/v1/public/characters/#{character_id}")
        .with(query: hash_including({
          apikey: Rails.application.secrets.marvel_api_public_key 
        })) 
        .to_return(:status => 200, :body => expected_body, :headers => {})
    end

    it 'makes outside calls' do
      character = subject.get_character character_id

      expect(character).to eq(expected_body)
    end
  end
end
