describe HomeController do
  describe '#index' do
    let!(:user) { create :user }

    context 'user has api_access' do
      let!(:api_access) { create :api_access, user: user }

      it 'sets the api key' do
        get :index, params: nil, session: { email: user.email }

        expect(assigns(:api_key)).to eq(user.api_key)
      end
    end

    context 'user does not have api_access' do
      it 'redirects to the new api key page' do
        get :index, params: nil, session: { email: user.email }

        expect(response).to redirect_to(new_api_access_path)
      end
    end
  end
end
