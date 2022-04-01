require 'rails_helper'

RSpec.describe 'Requests::UsersController', type: :request do
  describe 'GET /index' do
    before :each do
      get '/users'
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'responds with the correct text' do
      expect(response.body).to include('Users index page')
    end

    it ' has the right response status' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show' do
    before :each do
      get '/users/1'
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'responds with the correct text' do
      expect(response.body).to include('Show page user')
    end

    it ' has the right response status' do
      expect(response).to have_http_status(200)
    end
  end
end
