class Comment < ApplicationRecord
  after_save :update_comment_counter
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(
      post_id: @post.id,
      author_id: current_user.id,
      text: comment_params[:text]
    )
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      redirect_to post_path(@post), notice: 'Comment was not created.'
    end
  end

  private

  def update_comment_counter
    post.increment!(:commets_counter)
  end
end
