require 'rails_helper'

RSpec.describe 'Creating and updating user', type: :feature do

  scenario 'valid creation' do
    visit signup_path
    fill_in 'Username', with: 'User'
    fill_in 'Full name', with: 'User name'
    click_on 'Create User'
    expect(page).to have_content('User created successfuly')
  end

  scenario 'invalid creation' do
    visit signup_path
    click_on 'Create User'
    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content("Full name can't be blank")
  end

  scenario 'valid update' do
    @user = User.create(username: 'User', full_name: 'User name')
    visit login_path
    fill_in 'Username', with: @user.username
    click_on 'Log In'
    find("a[href='#{edit_user_path @user}']").click
    fill_in 'Full name', with: 'New User name'
    click_on 'Save'
    expect(page).to have_content("User updated successfuly")
  end

  scenario 'invalid update' do
    @user = User.create(username: 'User', full_name: 'User name')
    visit login_path
    fill_in 'Username', with: @user.username
    click_on 'Log In'
    find("a[href='#{edit_user_path @user}']").click
    fill_in 'Full name', with: ''
    click_on 'Save'
    expect(page).to have_content("Full name can't be blank")
  end
end
