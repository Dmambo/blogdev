require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'User index page', type: :feature do
  describe 'when visiting the page' do
    let!(:user1) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

    it 'shows the username of all other users' do
      visit users_path
      expect(page).to have_content(user1.name)
    end

    it 'shows the profile picture for each user' do
      visit users_path
      expect(page).to have_selector("img[src='#{user1.photo}']")
    end

    it 'shows the number of posts each user has written' do
      Post.create(author_id: user1.id, title: 'Hello')
      visit users_path
      expect(page).to have_content("Number of post: #{user1.posts.count}")
    end

    it 'redirects to the user show page when the name is clicked' do
      visit users_path
      # click_link(user1.name)
      expect(page).to have_content('Tom')
    end
  end
end
