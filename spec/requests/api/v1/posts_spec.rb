require 'swagger_helper'

RSpec.describe 'api/v1/users/{user_id}/posts', type: :request do
  path '/api/v1/users/{user_id}/posts' do
    get('list posts') do
      tags 'Posts'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      # schema: {
      #   type: :object,
      #   properties: {
      #     user_id: {type: :integer}
      #   },
      #   required: ['user_id']
      # }
      response(200, 'successful') do
        schema type: :array,
        items: {
          type: :object,
          properties: {
            id: {type: :integer},
            title: {type: :string},
            text: {type: :string},
            comments_counter: {type: :integer},
            likes_counter: {type: :integer},
            author_id: {type: :integer},
            created_at: {type: :string},
            updated_at: {type: :string} 
          }
        },
        required: ['author_id', 'title', 'text', 'comments_counter', 'likes_counter', 'created_at', 'updated_at']
    
        let(:id) do
          user = User.create!(id: 5, name: 'Tom', email: 'tom@example.com', password: '1234566',
                              confirmed_at: Time.now, posts_counter: 0, bio: 'Developer from Mexico')
          Post.create!(author_id: user.id, title: 'My first post', text: 'The text of my post', likes_counter: 0,
                       comments_counter: 0)
          { id: user.id }
        end
        run_test!
      end

      response '404', 'invalid request' do
        schema type: :object,
               properties: {
                 success: { type: :boolean },
                 message: {
                   type: :array,
                   items: { type: :string }
                 }
               }

        let(:user) { { user_id: '99' } }
        run_test!
      end
    end
  end
  path '/api/v1/posts/create' do

    post('create post') do
      consumes 'application/json'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          user_id: {type: :integer},
          title: { type: :string },
          text: { type: :string }
        },
        required: [ 'user_id', 'title', 'text' ]
      }
      response(201, 'Post created') do
        let(:post) do
          user = User.create!(id: 5, name: 'Tom', email: 'tom@example.com', password: '1234566',
                              confirmed_at: Time.now, posts_counter: 0, bio: 'Developer from Mexico')
          post = Post.create!(author: user, title: 'My first post', text: 'The text of my post', likes_counter: 0,
                        comments_counter: 0)
          { user_id: user.id, title: post.title, text: post.text }
        end
        run_test!
      end
      response '422', 'invalid request' do
        let(:post) { { title: 'foo' } }
        run_test!
      end
    end
  end
end

 

