require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'Post Title', body: 'Post Body', author: user) }

  describe 'associations' do
    it 'belongs to a post' do
      expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to)
    end

    it 'belongs to an author (User)' do
      expect(Comment.reflect_on_association(:author).macro).to eq(:belongs_to)
      expect(Comment.reflect_on_association(:author).class_name).to eq('User')
    end
  end
end
