class Comment < ApplicationRecord
  after_save :update_comment_counter
  belongs_to :author, class_name: 'User'
  belongs_to :post

  private

  def update_comment_counter
    post.increment!(:commets_counter)
  end
end
