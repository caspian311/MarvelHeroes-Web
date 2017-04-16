describe HomeController do
  describe '#index' do
    let!(:user) { create :user }
    let!(:api_access) { create :api_access, user: user }

    it 'sets the api key' do
      get :index, params: nil, session: { email: user.email }

      expect(assigns(:api_key)).to eq(user.api_key)
    end
  end
end
