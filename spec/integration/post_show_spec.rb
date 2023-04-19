require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  let!(:user) { User.create!(name: 'Tom', bio: 'Teacher from Mexico', posts_counter: 0) }
  let!(:post1) { Post.create!(title: 'Hello', content: 'This is my first post', author: user) }
  let!(:comment1) { Comment.create!(text: 'hi there', post: post1, author: user) }
  let!(:comment2) { Comment.create!(text: 'Thanks for sharing', post: post1, author: user) }
  let!(:like1) { Like.create!(post: post1, author: user) }

  describe 'visiting the post show page' do
    before { visit user_post_path(user, post1) }

    it 'displays the post title' do
      expect(page).to have_content post1.title
    end

    it 'displays the post author name' do
      expect(page).to have_content post1.author.name
    end

    it 'displays the number of comments for the post' do
      expect(page).to have_content post1.comments.count
    end

    it 'displays the number of likes for the post' do
      expect(page).to have_content post1.likes.count
    end

    it 'displays the post content' do
      expect(page).to have_content post1.title
    end

    it 'displays the name and text of each comment for the post' do
      post1.comments.each do |comment|
        expect(page).to have_content comment.author.name
        expect(page).to have_content comment.text
      end
    end
  end
end
