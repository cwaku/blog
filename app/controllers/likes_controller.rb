class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @new_like = current_user.likes.new(
      post_id: @post.id,
      author_id: current_user.id
    )
    respond_to do |format|
      format.html do
        if @new_like.save
          redirect_to user_post_path(@post.author_id, @post.id), notice: 'Like was successfully created.'
        else
          render :new, alert: 'Like was not created.'
        end
      end
    end
  end
end
