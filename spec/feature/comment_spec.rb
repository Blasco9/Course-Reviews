require 'rails_helper'

RSpec.describe 'Creating and deleting a comment', type: :feature do
  let(:user) { User.create(username: 'User', full_name: 'User name') }
  let(:course) { Course.create(name: 'Course', url: 'course.com', description: 'text', author: 'me') }
  let(:review) { user.reviews.create(text: 'Review text', course_id: course.id) }

  scenario 'valid creation' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    visit review_path review
    fill_in 'comment[text]', with: 'Comment text'
    click_on 'Submit'
    expect(page).to have_content("You commented on the review")
  end

  scenario 'invalid creation' do
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    visit review_path review
    fill_in 'comment[text]', with: ''
    click_on 'Submit'
    expect(page).to have_content("Text can't be blank")
  end

  scenario 'delete comment' do
    comment = user.comments.create(text: 'Comment text', review_id: review.id)
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log In'
    visit review_path review
    find("a[href='#{comment_path comment}']").click
    expect(page).to have_content("Comment deleted successfuly")
  end
end