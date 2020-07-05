require 'rails_helper'

RSpec.describe 'Creating, updating and deleting review', type: :feature do
  let(:user) { User.create(username: 'User', full_name: 'User name') }
  let(:course) { Course.create(name: 'Course', url: 'course.com', description: 'text', author: 'me') }

  scenario 'valid creation' do
    Course.create(name: 'Course', url: 'course.com', description: 'text', author: 'me')
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    visit root_path
    fill_in placeholder: 'Add New Review', with: 'Review text'
    click_on 'Submit'
    expect(page).to have_content('Review created successfuly')
  end

  scenario 'invalid creation' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    visit root_path
    fill_in placeholder: 'Add New Review', with: ''
    click_on 'Submit'
    expect(page).to have_content('Course must exist')
    expect(page).to have_content("Text can't be blank")
  end

  scenario 'valid update' do
    course = Course.create(name: 'Course', url: 'course.com', description: 'text', author: 'me')
    review = user.reviews.create(text: 'Review text', course_id: course.id)
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    find("a[href='#{edit_review_path review}']").click
    fill_in 'review[text]', with: 'Expanded review text'
    click_on 'Save Changes'
    expect(page).to have_content('Review updated successfuly')
  end

  scenario 'invalid update' do
    course = Course.create(name: 'Course', url: 'course.com', description: 'text', author: 'me')
    review = user.reviews.create(text: 'Review text', course_id: course.id)
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    find("a[href='#{edit_review_path review}']").click
    fill_in 'review[text]', with: ''
    click_on 'Save Changes'
    expect(page).to have_content("Review could not be saved. Text can't be blank")
  end

  scenario 'review deletion' do
    review = user.reviews.create(text: 'Comment text', course_id: course.id)
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    visit review_path review
    find("a[href='#{review_path review}']").click
    expect(page).to have_content('Review deleted successfuly')
  end
end
