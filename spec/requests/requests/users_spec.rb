require 'rails_helper'

RSpec.describe 'Requests::UsersController', type: :request do
  describe 'GET /index' do
    before :each do
      User.create(name: 'Ricky', photo: 'pic.jpg', bio: 'I am a test user', email: 'aass@example.com', password: 'password')
      get users_path
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'responds with the correct text' do
      expect(response.body).to include('Home')
    end

    it ' has the right response status' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    before :each do
      first_user = User.create(name: 'Ricky', photo: 'pic.jpg', bio: 'I am a test user', email: 'aass@example.com', password: 'password')
      get user_path(id: first_user.id)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'responds with the correct text' do
      expect(response.body).to include('see all posts')
    end

    it ' has the right response status' do
      expect(response).to have_http_status(200)
    end
  end
end
