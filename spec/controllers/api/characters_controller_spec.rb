describe Api::CharactersController do
  let!(:character1) { create :character }
  let!(:character2) { create :character }
  let!(:character3) { create :character }
  let!(:characters) { [character1, character2, character3] }
  let(:auth) { "Token token=#{api_key}" }

  before do
    allow_any_instance_of(CharacterService).to receive(:all_characters) { characters }
    @request.env['HTTP_AUTHORIZATION'] = auth
  end

  context 'authenticated requests' do
    let!(:user) { create :user_with_api_key }
    let(:api_key) { user.api_key }

    describe '#index' do
      it 'should return all characters' do
        get :index, params: {}
        expect(response).to have_http_status(200)
      end

      it 'should return all characters' do
        get :index, params: {}
        expect(JSON.parse(response.body).length).to eq(3)
      end
    end
  end

  context 'unauthenticated requests' do
    let(:auth) { nil }

    describe '#index' do
      it 'should return unauthorized status code' do
        get :index, params: {}

        expect(response).to have_http_status(401)
      end
    end
  end

  context 'unauthorized requests' do
    let!(:user) { create :user_with_api_key }
    let(:api_key) { '123' }

    describe '#index' do
      it 'should return unauthorized status code' do
        get :index, params: {}

        expect(response).to have_http_status(401)
      end
    end
  end
end
