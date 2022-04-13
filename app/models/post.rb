class Post < ApplicationRecord
  after_save :update_post_counter
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
