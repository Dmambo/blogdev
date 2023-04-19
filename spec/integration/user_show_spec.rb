require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  let!(:user) { User.create!(name: 'Tom', bio: 'Teacher from Mexico', posts_counter: 0) }
  let!(:post1) { Post.create!(title: 'Hello', text: 'This is my first post', author: user) }
  let!(:post2) { Post.create!(title: 'Second post', text: 'This is my second post', author: user) }
  let!(:comment1) { Comment.create!(text: 'hi there', post: post1, author: user) }
  let!(:comment2) { Comment.create!(text: 'Thanks for sharing', post: post1, author: user) }
  let!(:like1) { Like.create!(post: post1, author: user) }

  scenario 'User can view posts and their details' do
    visit user_posts_path(user)

    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.count}")
    expect(page).to have_content(post1.title)
    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
    expect(page).to have_content("Comments: #{post1.comments.count}")
    expect(page).to have_content("Likes: #{post1.likes.count}")
    expect(page).to have_link('Create A Post', href: new_user_post_path(user))
  end
end
