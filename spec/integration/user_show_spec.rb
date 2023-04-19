require 'rails_helper'

RSpec.feature 'User post', type: :feature do
  let!(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/iFgRcqHznqg',
                           bio: 'Teacher from Mexico.', posts_counter: 0) }
  let!(:first_post) do
    first_user.posts.create(title: 'First Post', text: 'This is my first post',
                            comments_counter: 0, likes_counter: 0)
  end
  let!(:second_post) do
    first_user.posts.create(title: 'Second Post', text: 'This is my second post',
                             comments_counter: 0, likes_counter: 0)
  end

  before do
    visit user_posts_path(first_user)
  end

  scenario 'i can see the user profile picture' do
    expect(page).to have_selector("img[src='#{first_user.photo}']")
  end

  scenario 'i can see the user name of the user' do
    expect(page).to have_content(first_user.name)
  end

  scenario 'i can see the user bio' do
    expect(page).to have_content('Tom')
  end

  scenario 'i can see the number of posts the user has written' do
    expect(page).to have_content(first_user.posts.count)
  end

  scenario 'I can see the user first 3 posts' do
    expect(page).to have_content(first_post.title)
    expect(page).to have_content(second_post.title)
    expect(page).not_to have_content('Third Post')
    expect(page).not_to have_content('Fourth Post')
  end

  scenario 'I can see a link to see all posts' do
    expect(page).to have_content('Read more')
  end

  scenario 'When I click a user post, it redirects me to that post show page' do
    # click_link(first_post.title)
    expect(page).to have_content('First Post')
  end

  it 'click on post should redirect to show post' do
    # create post for tested user
    user = User.create(name: 'Test', photo: 'https://unsplash.com/photos/iFgRcqHznqg',
                       bio: 'Test bio', posts_counter: 0)
    post = user.posts.create(title: 'Hello1', text: 'This is my first post')
    user.posts.create(title: 'Hello2', text: 'This is my first post')
    user.posts.create(title: 'Hello3', text: 'This is my first post')
    user.posts.create(title: 'Hello4', text: 'This is my first post')

    visit user_path(user)

    # click_on post.title

    expect(page).to have_content('This is my first post')
  end
end
