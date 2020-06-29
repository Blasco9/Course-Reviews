# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Following and unfolowing users', type: :feature do
  before(:each) do
    @user = User.create(username: 'First', full_name: 'User name')
    @another_user = User.create(username: 'Second', full_name: 'User name')
  end

  scenario 'follow user' do
    visit login_path
    fill_in 'Username', with: @user.username
    click_on 'Log In'
    visit root_path
    click_on '+'
    visit user_path @user
    within('section.following') do
      expect(page).to have_content(@another_user.username)
    end
  end

  scenario 'unfollow user' do
    @user.followeds << @another_user
    visit login_path
    fill_in 'Username', with: @user.username
    click_on 'Log In'
    click_on '-'
    within('section.following') do
      expect(page).not_to have_content(@another_user.username)
    end
  end
end
