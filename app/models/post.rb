class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :update_author_posts_counter

  private

  def update_author_posts_counter
    author.increment!(:posts_counter)
  end
end
