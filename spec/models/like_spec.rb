require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { FactoryBot.build(:like) }

  it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
  it { should belong_to(:post).counter_cache(true) }
  it { should validate_presence_of(:post) }
  it { should validate_numericality_of(:post_id).only_integer }

  describe 'update_like_counter' do
    let(:post) { FactoryBot.create(:post) }

    it 'updates likes_count on associated post' do
      expect do
        FactoryBot.create(:like, post:)
      end.to change { post.reload.likes_count }.by(1)
    end
  end
end
