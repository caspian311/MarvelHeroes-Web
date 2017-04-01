describe 'full run', js: true do
  context 'user already exists' do
    let(:user){ create :user }

    it 'sign up to see token' do
      visit '/session/new'

      expect(page).to have_content('Sign In')

      fill_in 'email', with: user.email
      fill_in 'password', with: user.password

      save_and_open_screenshot

      click_button 'Sign In'

      expect(page).to have_content('Main')
    end
  end
end
