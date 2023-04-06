class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :text, presence: true

  def update_comment_counter
    post.update(comments_count: post.comments.count)
  end
end
