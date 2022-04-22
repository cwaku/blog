require 'rails_helper'

RSpec.describe 'Requests::PostsController', type: :request do
  describe 'GET /index' do
    before :each do
      first_user = User.create!(name: 'Ricky', photo: 'photo.jpg', bio: 'Alien from Earth 300.',
                                email: 'suur@example.com', password: 'password')
      Post.create!(author_id: first_user.id, title: 'BopBop Beep', text: 'This is my first visit to Mars.')
      get user_posts_path(user_id: first_user.id)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'responds wit the correct text' do
      expect(response.body).to include('BopBop Beep')
    end

    it ' has the right response status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    before :each do
      first_user = User.create!(name: 'Ricky', photo: 'photo.jpg', bio: 'Alien from Earth 300.',
                                email: 'suur@example.com', password: 'password')
      first_post = Post.create!(author_id: first_user.id, title: 'BopBop Beep', text: 'This is my first visit to Mars.')
      get user_post_path(user_id: first_user.id, id: first_post.id)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'responds with the correct text' do
      expect(response.body).to include('')
    end

    it ' has the right response status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
