require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }

  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should have_many(:likes) }
end
