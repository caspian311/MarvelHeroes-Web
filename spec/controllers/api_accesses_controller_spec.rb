describe ApiAccessesController do
  let(:public_key) { 'public key' }
  let(:private_key) { 'private key' }
  let(:payload) { { api_access: { public_key: public_key, private_key: private_key } } }
  let(:bad_payload) { { api_access: { public_key: '', private_key: '' } } }

  describe '#new' do
    let!(:user) { create :user }

    context 'logged in user' do
      let(:email) { user.email }

      it 'sets a blank api_access' do
        get :new, session: { email: email }

        expect(assigns(:api_access)).to_not be_nil
      end
    end

    context 'logged in user with access api' do
      let(:email) { user.email }
      let!(:api_access) { create :api_access, user: user }

      it 'sets a blank api_access' do
        get :new, session: { email: email }

        expect(response).to redirect_to(home_index_path)
      end
    end

    context 'not logged in user' do
      let(:email) { nil }

      it 'redirects to the login page' do
        get :new

        expect(response).to redirect_to(new_session_path)
      end
    end
  end

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

  describe '#destroy' do
    context 'logged in user' do
      let!(:user) { create :user }
      let!(:api_access) { create :api_access, user: user }

      before do
        delete :destroy, params: { id: api_access.id }, session: { email: user.email }
      end

      it 'should redirect to new' do
        expect(response).to redirect_to(new_api_access_path)
      end

      it 'should delete access' do
        user.reload
        expect(user.api_access.present?).to be_falsey
      end
    end

    context 'user without api access' do
      let!(:user) { create :user }

      before do
        delete :destroy, params: { id: 123 }, session: { email: user.email }
      end

      it 'should redirect to new' do
        expect(response).to redirect_to(new_api_access_path)
      end
    end

    context 'not logged in user' do
      it 'redirects to the login page' do
        delete :destroy, params: { id: 111 }

        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
