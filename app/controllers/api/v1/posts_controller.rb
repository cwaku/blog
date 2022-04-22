module Api
  module V1
    class PostsController < ApplicationController
      def index
        if request.headers['ApiToken']
          @user = User.find_by(apiToken: request.headers['ApiToken'])
          @posts = Post.where(author_id: @user.id)

          render json: { success: true, message: 'Posts found', posts: @posts }, status: :ok
        else
          render json: { success: false, message: 'Unauthorized' }, status: :unauthorized
        end
      end

      def create
        if request.headers['ApiToken']
          @user = User.find_by(apiToken: request.headers['ApiToken'])

          @new_post = @user.posts.new(
            title: params[:title],
            text: params[:text]
          )

          respond_to do |format|
            format.json do
              if @new_post.save
                render json: { success: true, message: 'Post was successfully created.' }, status: :ok
              else
                render json: { success: false, message: 'Post was not created.' }, status: :unprocessable_entity
              end
            end
          end
        else
          render json: { success: false, message: 'Unauthorized' }, status: :unauthorized
        end
      end
    end
  end
end
