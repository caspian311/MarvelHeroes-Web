describe CharacterService do
  describe '#fetch' do
    context 'cache miss' do
      let(:character_id){ '123345' }

      let(:response){ '{ "foo": "bar" }' }

      before do
        allow_any_instance_of(MarvelApi).to receive(:get_character) { response }
      end

      it 'should fetch from api' do
        expect_any_instance_of(MarvelApi).to receive(:get_character)
          .with(character_id) { response }

        subject.fetch character_id
      end

      it 'should populate the database' do
        subject.fetch character_id
        
        expect(Character.count).to eq(1)
        expect(Character.first.character_id).to eq(character_id)
        expect(Character.first.body).to eq(JSON.parse(response))
      end
    end

    context 'cache hit' do
      let!(:character){ create :character }

      it 'should fetch from api' do
        expect_any_instance_of(MarvelApi).not_to receive(:get_character)

        subject.fetch character.character_id
      end

      it 'should return body of character' do
        body = subject.fetch character.character_id
        
        expect(body).to eq(character.body)
      end
    end
  end
end
