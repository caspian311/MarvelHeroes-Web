describe SessionController do
  describe '#new' do
    it 'should populate an empty user' do
      get :new

      expect(assigns(:user).email).to eq(nil)
      expect(assigns(:user).password).to eq(nil)
    end
  end

  describe '#create' do
    let(:name) { Faker::Name.name }
    let(:email) { Faker::Internet.email }
    let(:pass) { Faker::Lorem.word }

    context 'user exists' do
      let!(:user) { create :user, name: name, email: email, password: pass }

      it 'should redirect to home page' do
        post :create,  params: { session: { email: email, password: pass } }

        expect(response).to redirect_to(home_index_path)
      end
    end

    context 'user does not exist' do
      it 'should redirect to home page' do
        post :create,  params: { session: { email: email, password: pass } }

        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end

