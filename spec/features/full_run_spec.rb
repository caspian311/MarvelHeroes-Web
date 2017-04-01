describe 'full run', js: true do
  context 'user already exists' do
    let!(:user){ create :user }

    it 'sign up to see token' do
      visit '/session/new'

      expect(page).to have_content('Sign In')

      fill_in 'email', with: user.email
      fill_in 'password', with: user.password

      click_button 'Login'

      wait_for_ajax

      expect(page).to have_content('Main')
    end
  end

  context 'user does not exist yet' do
    let(:email){ 'mt123@hat.dog' }
    let(:password){ 'pass123' }

    it 'sign up to see token' do
      visit '/users/new'

      expect(page).to have_content('Sign Up')

      fill_in 'email', with: email
      fill_in 'password', with: password

      click_button 'Sign Up'

      wait_for_ajax

      expect(page).to have_content('Main')
    end
  end
end
