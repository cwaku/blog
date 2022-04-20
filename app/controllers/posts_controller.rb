class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes).order(created_at: :desc)
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
    @user = @post.author
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = current_user.posts.new(post_params)
    respond_to do |format|
      format.html do
        if @new_post.save
          redirect_to "/users/#{@new_post.author.id}/posts/", notice: 'Post was successfully created.'
        else
          render :new
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post, :message => "Unable to delete this post."
    @post.destroy
    redirect_to "/users/#{@new_post.author.id}/posts/", notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
