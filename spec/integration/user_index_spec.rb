require 'rails_helper'
require 'capybara/rails'

RSpec.feature "User index page", type: :feature do
  let!(:user1) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')}
  
  scenario "shows the username of all other users" do
    visit users_path
        expect(page).to have_content(user1.name)
  end
  
  scenario "shows the profile picture for each user" do
    visit users_path
    expect(page).to have_selector("img[src='#{user1.photo}']")
  end
  
  scenario "shows the number of posts each user has written" do
    post1 = Post.create(author_id: user1.id, title: "Hello")

    
    visit users_path
    expect(page).to have_content("Number of post: #{user1.posts.count}", count: 0)
  end
  
  scenario "redirects to the user's show page when clicked" do
    visit users_path
    expect(page).to have_link(user1.name, href: user_path(user1))
    click_link user1.name
    expect(has_current_path?(user_path(user1), wait: 5)).to be_truthy
  end
  
  
end
