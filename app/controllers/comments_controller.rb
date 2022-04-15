class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = current_user.comments.new(
      post_id: @post.id,
      author_id: current_user.id,
      text: comment_params
    )
    @new_comment.post_id = @post.id
    respond_to do |format|
      format.html do
        if @new_comment.save
          redirect_to user_post_path(@post.author_id, @post.id), notice: 'Comment was successfully created.'
        else
          render :new, alert: 'Comment was not created.'
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
