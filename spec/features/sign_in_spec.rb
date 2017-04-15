describe 'sign in', js: true do
  context 'user already exists' do
    let!(:user){ create :user }

    it 'sign up to see token' do
      visit '/'

      expect(page).to have_content('Sign In')

      fill_in 'session_email', with: user.email
      fill_in 'session_password', with: user.password

      click_button 'Sign In'

      expect(page).to have_content('Main')
    end
  end
end if false
