module Api
  module V1
    
    class CommentsController < ApplicationController
      def index
        if request.headers['ApiToken']
          @user = User.find_by(api_token: request.headers['ApiToken'])
          @comments = Comment.where(author_id: @user.id)

          render json: { success: true, message: 'Comments found', comments: @comments }, status: :ok
        else
          render json: { success: false, message: 'Unauthorized' }, status: :unauthorized
        end
      end

      def create
        if request.headers['ApiToken']
          @user = User.find_by(api_token: request.headers['ApiToken'])
          @post = Post.find(params[:post_id])
          @new_comment = @user.comments.new(
            post_id: @post.id,
            author_id: @user.id,
            text: comment_params
          )
          @new_comment.post_id = @post.id
          respond_to do |format|
            format.json do
              if @new_comment.save
                render json: { success: true, message: 'Comment was successfully created.' }, status: :ok
              else
                render json: { success: false, message: 'Comment was not created.' }, status: :unprocessable_entity
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
