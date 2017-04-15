describe UsersController do
  describe '#new' do
    it 'creates empty user' do
      get :new

      expect(assigns(:user).name).to eq(nil)
      expect(assigns(:user).email).to eq(nil)
      expect(assigns(:user).password).to eq(nil)
    end
  end

  describe '#create' do
    context 'email is unique' do
      let(:name) { 'user name' }
      let(:email) { 'user email' }
      let(:pass) { 'user pass' }

      before do
        get :create, params: { user: { name: name, email: email, password: pass } }
      end

      it 'creates a new user' do
        expect(User.count).to eq(1)
      end

      it 'redirects to the home page' do
        expect(response).to redirect_to home_index_path
      end
    end

    context 'email is not unique' do
      let(:name) { 'user name' }
      let(:email) { 'user email' }
      let(:pass) { 'user pass' }

      before do
        create :user, name: name, email: email, password: pass

        get :create, params: { user: { name: name, email: email, password: pass } }
      end

      it 'does not create a new user' do
        expect(User.count).to eq(1)
      end

      it 'redirects to the sign up page' do
        expect(response).to redirect_to new_user_path
      end
    end
  end
end
