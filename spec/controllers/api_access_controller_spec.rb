describe ApiAccessesController do
  let(:public_key) { 'public key' }
  let(:private_key) { 'private key' }
  let(:payload) { { api_access: { public_key: public_key, private_key: private_key } } }
  let(:bad_payload) { { api_access: { public_key: '', private_key: '' } } }

  describe '#create' do
    context 'logged in user' do
      let!(:user) { create :user }

      context 'invalid parameters' do
        before do
          post :create, params: bad_payload, session: { email: user.email }
        end

        it 'redirects to new page' do
          expect(response).to redirect_to(new_api_access_path)
        end

        it 'populates a flash message saying that both keys are needed' do
          expect(flash[:error]).to eq('Both public and private keys are required to create an API key')
        end
      end

      context 'valid parameters' do
        before do
          post :create, params: payload, session: { email: user.email }
        end

        it 'creates the api access on the user' do
          expect(user.api_access.public_key).to eq(public_key)
          expect(user.api_access.private_key).to eq(private_key)
        end

        it 'generates an api key' do
          expect(user.api_access.api_key).not_to be_nil
        end

        it 'redirects to home page' do
          expect(response).to redirect_to(home_index_path)
        end
      end
    end

    context 'not logged in user' do
      it 'redirects to the login page' do
        post :create, params: payload

        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
