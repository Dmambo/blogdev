require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it 'belongs to author' do
      like = Like.reflect_on_association(:author)
      expect(like.macro).to eq(:belongs_to)
      expect(like.options[:class_name]).to eq('User')
      expect(like.options[:foreign_key]).to eq('author_id')
    end

    it 'belongs to post' do
      like = Like.reflect_on_association(:post)
      expect(like.macro).to eq(:belongs_to)
      expect(like.options[:counter_cache]).to eq(true)
    end
  end

  describe 'validations' do
    it 'validates presence of post' do
      like = Like.new(post: nil)
      expect(like).not_to be_valid
      expect(like.errors[:post]).to include("can't be blank")
    end
  end
end
