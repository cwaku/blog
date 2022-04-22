module Api
  module V1
    class UsersController < ApplicationController
      def register
        @user = User.new(name: params[:name], email: params[:email], password: params[:password])
        if @user.save
          render json: { success: true, message: 'User was successfully created.' }, status: :ok
        else
          render json: { success: false, message: 'User was not created.' }, status: :unprocessable_entity
        end
      end

      def login
        valid = User.find_by(email: params[:email]).valid_password?(params[:password])
        if valid
          @user = User.find_by(email: params[:email])
          @user.apiToken = Devise.friendly_token.to_s
          @user.save
          respond_to do |format|
            format.json do
              render json: { success: true, message: 'User was logged in.', user: @user }, status: :ok
            end
          end
        else
          respond_to do |format|
            format.json do
              render json: { success: false, message: 'User was not logged in.' }, status: :unprocessable_entity
            end
          end
        end
      end
    end
  end
end
