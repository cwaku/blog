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
          redirect_to "/users/#{@new_comment.author.id}/comments/", notice: 'Comment was successfully created.'
        else
          render :new
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
