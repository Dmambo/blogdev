require 'rails_helper'

RSpec.feature 'Post index page' do
  let!(:user) { User.create!(name: 'Tom', bio: 'Teacher from Mexico', posts_counter: 0) }
  let!(:post1) { Post.create!(title: 'Hello', content: 'This is my first post', author: user) }
  let!(:comment1) { Comment.create!(text: 'hi there', post: post1, author: user) }
  let!(:comment2) { Comment.create!(text: 'Thanks for sharing', post: post1, author: user) }
  let!(:like1) { Like.create!(post: post1, author: user) }

  scenario 'displays post information' do
    visit user_posts_path(user)

    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.count}")
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.content[0..50]) # Display only part of the post's body
    expect(page).to have_content(comment1.text)
    expect(page).to have_content("Comments: #{post1.comments.count}")
    expect(page).to have_content("Likes: #{post1.likes.count}")
    expect(page).to have_link('Read more', href: user_post_path(user, post1))
    expect(page).to have_link('Create A Post', href: new_user_post_path(user))
    expect(page).to have_link('Back', href: user_path(user))
  end

  scenario 'redirects to post show page' do
    visit user_posts_path(user)
    click_link 'Read more', match: :first

    expect(current_path).to eq(user_post_path(user, post1))
    expect(page).to have_content(post1.title)

    expect(page).to have_content("Comments: #{post1.comments.count}")
    expect(page).to have_content("Likes: #{post1.likes.count}")
  end
end