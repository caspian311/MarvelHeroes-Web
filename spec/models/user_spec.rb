describe User do
  describe '.create_with_api_key!' do
    it 'create a user' do
      expect do
        described_class.create_with_api_key! name: 'monkey',
                                             email: 'foo@bar',
                                             password: 'pass'
      end.to change { User.count }.from(0).to(1)
    end

    it 'create an api_access' do
      expect do
        described_class.create_with_api_key! name: 'monkey',
                                             email: 'foo@bar',
                                             password: 'pass'
      end.to change { ApiAccess.count }.from(0).to(1)
    end

    it 'assigns the api_access to the user' do
      user = described_class.create_with_api_key! name: 'monkey',
                                                  email: 'foo@bar',
                                                  password: 'pass'
      expect(user.api_access).to be_present
    end
  end
end
