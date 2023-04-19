require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  let!(:user) { User.create!(name: 'Tom', bio: 'Teacher from Mexico', posts_counter: 0) }
  let!(:post1) { Post.create!(title: 'Hello', content: 'This is my first post', author: user) }
  let!(:comment1) { Comment.create!(text: 'hi there', post: post1, author: user) }
  let!(:comment2) { Comment.create!(text: 'Thanks for sharing', post: post1, author: user) }
  let!(:like1) { Like.create!(post: post1, author: user) }

  scenario 'user visits the post show page' do
    visit user_post_path(user, post1)

    expect(page).to have_content post1.title
    expect(page).to have_content post1.author.name
    expect(page).to have_content post1.comments.count
    expect(page).to have_content post1.likes.count
    expect(page).to have_content post1.text

    post1.comments.each do |comment|
      expect(page).to have_content comment.author.name
      expect(page).to have_content comment.text
    end
  end
end
