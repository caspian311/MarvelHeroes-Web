describe 'Full Run', js: true do
  context 'new user' do
    let(:name) { 'Test User' }
    let(:email) { 'mt123@hat.dog' }
    let(:password) { 'pass123' }
    let(:public_key) { 'public key' }
    let(:private_key) { 'private key' }

    it 'should be able to generate a usable api key' do
      visit '/'

      click_link 'New user?'

      expect(page).to have_content('Sign Up')

      fill_in 'user_name', with: name
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password

      click_button 'Sign Up'

      expect(page).to have_content("Marvel Heroes Welcome, #{name}!")

      expect(page).to have_content('It appears that you do not have access to the API')

      click_button 'Create API Key'

      expect(page).to have_content('Both public and private keys are required to create an API key')

      fill_in 'api_access_public_key', with: public_key
      fill_in 'api_access_private_key', with: private_key

      click_button 'Create API Key'

      expect(page).to have_content('Below is your API key. Use with great care.')

      api_key = find('#api_key').text

      Capybara.current_session.driver.header 'Authorization', 'Token token=foo'
      visit api_characters_path

      expect(status_code).to eq(401)

      Capybara.current_session.driver.header 'Authorization', "Token token=#{api_key}"
      visit api_characters_path

      expect(status_code).to eq(200)
    end
  end
end
