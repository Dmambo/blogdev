require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { Post.create(title: 'Post Title', body: 'Post Body', author: user) }

  # describe "validations" do
  #   it "requires text to be present" do
  #     comment = Comment.new(post: post, author: user)
  #     expect(comment).not_to be_valid
  #     expect(comment.errors[:text]).to include("can't be blank")
  #   end
  # end

  describe 'associations' do
    it 'belongs to a post' do
      expect(Comment.reflect_on_association(:post).macro).to eq(:belongs_to)
    end

    it 'belongs to an author (User)' do
      expect(Comment.reflect_on_association(:author).macro).to eq(:belongs_to)
      expect(Comment.reflect_on_association(:author).class_name).to eq('User')
    end
  end

  # describe "callbacks" do
  #   it "updates the comments_counter of its post after save" do
  #     comment = Comment.new(text: 'Comment Text', post: post, author: user)
  #     comment.save
  #     expect(post.reload.comments_counter).to eq(1)

  #     comment.destroy
  #     expect(post.reload.comments_counter).to eq(0)
  #   end
  # end
end
