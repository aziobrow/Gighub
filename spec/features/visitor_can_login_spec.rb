feature 'When a returning visitor tries to log in' do

  background do
    create(:user, username: 'JaneDoe89', password: 'pw')
    visit root_path
    click_on '#login'
    fill_in 'session[username]', with: 'JaneDoe89'
    fill_in 'session[password]', with: 'pw'
    click_on 'Create User'
  end

  scenario 'they are taken to the user dashboard' do
    expect(page).to have_current_path('/dashboard')
  end

  scenario 'they see a success message' do
    expect('.success').to have_content('Logged in as JaneDoe89')
  end

  scenario 'they see their profile info' do
    expect(find('main')).to have_content('JaneDoe89')
    expect(find('main')).to have_content('janedoe89@example.com')
  end

  scenario 'they do not see a "Login" button' do
    expect(page).to_not have_link("Login")
  end

  scenario 'they see a "Logout" button' do
    expect(page).to have_link("Logout", href: logout_path)
  end

end
