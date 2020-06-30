require 'rails_helper'

RSpec.describe 'Logging in and out', type: :feature do
  let(:user) { User.create(username: 'User', full_name: 'User name') }

  scenario 'valid login' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    expect(page).to have_content('Logged in successfuly')
  end

  scenario 'invalid login' do
    visit login_path
    fill_in 'Username', with: ''
    click_on 'Log In'
    expect(page).to have_content('Invalid username')
  end

  scenario 'logout' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    click_on 'SIGN OUT'
    expect(page).to have_content('You logged out')
  end
end
