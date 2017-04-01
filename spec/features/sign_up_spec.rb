describe 'sign up', js: true do
  it 'redirects to the sign up page' do
    visit '/home'

    expect(page).to have_content('Sign In')

    click_link 'New User?'

    expect(page).to have_content('Sign Up')

    fill_in 'email', with: 'matt.todd@hat.dog'
    fill_in 'password', with: 'password'

    wait_for_ajax

    click_button 'Sign Up'
  end
end
