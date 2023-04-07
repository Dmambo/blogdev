require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it 'belongs to author' do
      post = Post.reflect_on_association(:author)
      expect(post.macro).to eq(:belongs_to)
    end

    it 'has many comments' do
      post = Post.reflect_on_association(:comments)
      expect(post.macro).to eq(:has_many)
      expect(post.options[:dependent]).to eq(:destroy)
    end

    it 'has many likes' do
      post = Post.reflect_on_association(:likes)
      expect(post.macro).to eq(:has_many)
      expect(post.options[:dependent]).to eq(:destroy)
    end
  end

  describe 'validations' do
    it 'validates presence of title' do
      post = Post.new(title: nil)
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'validates length of title' do
      post = Post.new(title: 'a' * 251)
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    it 'validates numericality of comments_counter' do
      post = Post.new(comments_counter: 'not a number')
      expect(post).not_to be_valid
      expect(post.errors[:comments_counter]).to include('is not a number')
      post = Post.new(comments_counter: -1)
      expect(post).not_to be_valid
      expect(post.errors[:comments_counter]).to include('must be greater than or equal to 0')
    end

    it 'validates numericality of likes_counter' do
      post = Post.new(likes_counter: 'not a number')
      expect(post).not_to be_valid
      expect(post.errors[:likes_counter]).to include('is not a number')
      post = Post.new(likes_counter: -1)
      expect(post).not_to be_valid
      expect(post.errors[:likes_counter]).to include('must be greater than or equal to 0')
    end
  end
end
