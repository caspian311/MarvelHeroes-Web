describe CharacterService do
  let!(:user) { create :user_with_api_key }
  subject { described_class.new user }

  describe '#fetch' do
    context 'cache miss' do
      let(:character_id) { '123345' }

      let(:response) { '{ "foo": "bar" }' }

      before do
        allow_any_instance_of(MarvelApi).to receive(:get_character) { response }
      end

      it 'should fetch from api' do
        expect_any_instance_of(MarvelApi).to receive(:get_character)
          .with(character_id) { response }

        subject.fetch character_id
      end
    end
  end
end
