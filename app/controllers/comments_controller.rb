class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @new_comment = current_user.comments.new(
      post_id: @post.id,
      author_id: current_user.id,
      text: comment_params[:text]
    )
    respond_to do |format|
      format.html do
        if @new_comment.save
          redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", notice: 'Comment was successfully created.'
        else
          render :new, alert: 'Comment was not created.'
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
