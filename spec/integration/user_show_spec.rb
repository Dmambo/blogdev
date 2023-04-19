require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'User post index page', type: :feature do
  let!(:user) { User.create!(name: 'Tom', bio: 'Teacher from Mexico', posts_counter: 0) }
  let!(:post1) { Post.create!(title: 'Hello', text: 'This is my first post', author: user) }
  let!(:post2) { Post.create!(title: 'Second post', text: 'This is my second post', author: user) }
  let!(:comment1) { Comment.create!(text: 'hi there', post: post1, author: user) }
  let!(:comment2) { Comment.create!(text: 'Thanks for sharing', post: post1, author: user) }
  let!(:like1) { Like.create!(post: post1, author: user) }

  describe 'User posts index page' do
    before { visit user_posts_path(user) }

    describe 'User profile information' do
      it 'displays user photo' do
        expect(page).to have_css("img[src*='#{user.photo}']")
      end

      it 'displays user name' do
        expect(page).to have_content(user.name)
      end
    end

    describe 'User posts' do
      it 'displays number of posts' do
        expect(page).to have_content("Number of posts: #{user.posts.count}")
      end

      it 'displays post title and text' do
        expect(page).to have_content(post1.title)
        expect(page).to have_content(post2.title)
      end
    end

    describe 'Post details' do
      it 'displays comments on the post' do
        expect(page).to have_content("Comments: #{post1.comments.count}")
        expect(page).to have_content(comment1.text)
        expect(page).to have_content(comment2.text)
      end

      it 'displays likes on the post' do
        expect(page).to have_content("Likes: #{post1.likes.count}")
      end
    end

    describe 'Create a post link' do
      it 'displays link to create a post' do
        expect(page).to have_link('Create A Post', href: new_user_post_path(user))
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
