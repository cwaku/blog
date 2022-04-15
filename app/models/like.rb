class Like < ApplicationRecord
  after_save :update_like_counter
  belongs_to :author, class_name: 'User'
  belongs_to :post

  private

  def update_like_counter
    post.increment!(:likes_counter)
  end
end
