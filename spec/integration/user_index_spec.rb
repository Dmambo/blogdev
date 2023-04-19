require 'rails_helper'
require 'capybara/rails'

RSpec.feature 'User index page', type: :feature do
  let!(:user1) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  scenario 'shows the username of all other users' do
    visit users_path
    expect(page).to have_content(user1.name)
  end

  scenario 'shows the profile picture for each user' do
    visit users_path
    expect(page).to have_selector("img[src='#{user1.photo}']")
  end

  scenario 'shows the number of posts each user has written' do
    Post.create(author_id: user1.id, title: 'Hello')

    visit users_path
    expect(page).to have_content("Number of post: #{user1.posts.count}", count: 0)
  end
end
