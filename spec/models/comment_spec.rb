require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { FactoryBot.build(:comment) }

  it { should validate_presence_of(:text) }

  it { should belong_to(:post) }
  it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }

  describe 'update_comment_counter' do
    let(:post) { FactoryBot.create(:post) }

    it 'updates comments_count on associated post' do
      expect do
        FactoryBot.create(:comment, post:)
      end.to change { post.reload.comments_count }.by(1)
    end
  end
end
