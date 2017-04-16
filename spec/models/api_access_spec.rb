describe ApiAccess do
  let!(:user) { create :user }

  describe '.create_with_key!' do
    it 'increases the number of api_accesses' do
      expect do
        described_class.create_with_key! user
      end.to change { ApiAccess.count }.from(0).to(1)
    end

    it 'generates a new api_key' do
      api_access = described_class.create_with_key! user
      expect(api_access.api_key).to be_present
    end

    it 'generates a unique key' do
      num_of_keys = 50
      api_keys = (0...num_of_keys).map do
        described_class.create_with_key!(user).api_key
      end.uniq
      expect(api_keys.length).to eq num_of_keys
    end
  end
end
