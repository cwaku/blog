class PostsController < ApplicationController
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
