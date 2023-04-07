class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy do
    def by_author(user)
      where(author_id: user.id)
    end
  end
  has_many :likes, dependent: :destroy

  after_create :update_author_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  private

  def update_author_posts_counter
    author.increment!(:posts_counter)
  end
end
