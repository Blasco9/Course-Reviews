require 'rails_helper'

RSpec.describe 'Creating a course', type: :feature do
  let(:user) { User.create(username: 'User', full_name: 'User name') }

  scenario 'valid creation' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    find("a[href='#{new_course_path}']").click
    fill_in 'Name', with: 'Course'
    fill_in 'Url', with: 'course.com'
    fill_in 'Description', with: 'Course description'
    fill_in 'Author', with: 'Someone'
    click_on 'Create Course'
    expect(page).to have_content('Course created successfuly')
  end

  scenario 'invalid creation' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    find("a[href='#{new_course_path}']").click
    fill_in 'Name', with: ''
    fill_in 'Url', with: ''
    fill_in 'Description', with: ''
    fill_in 'Author', with: ''
    click_on 'Create Course'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Url can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Author can't be blank")
  end
end
