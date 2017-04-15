describe 'sign up', js: true do
  context 'user does not exist yet' do
    let(:email){ 'mt123@hat.dog' }
    let(:password){ 'pass123' }

    it 'sign up to see token' do
      visit '/'

      click_link 'New user?'

      expect(page).to have_content('Sign Up')

      fill_in 'user_email', with: email
      fill_in 'user_password', with: password

      click_button 'Sign Up'

      expect(page).to have_content('Main')
    end
  end
end if false
