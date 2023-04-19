require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a user' do
    let(:user) { User.create(name: 'John Doe', posts_counter: 0) }

    it 'is valid with a name and posts_counter' do
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'can have many posts, comments, and likes' do
      expect(user.posts).to be_empty
      post = Post.create(author: user, title: 'My first post', content: 'Hello world!')
      expect(user.posts).to eq [post]
    end
  end
end
