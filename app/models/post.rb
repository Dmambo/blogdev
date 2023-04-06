class Post < ApplicationRecord
  attr_accessor :author

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :update_author_posts_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_author_posts_count
    author.update_posts_count
  end
end
