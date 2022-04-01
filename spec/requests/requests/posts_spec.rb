require 'rails_helper'

RSpec.describe "Requests::PostsController", type: :request do
  describe "GET /index" do
    before :each do
      get "/users/1/posts"
    end

    it "renders the correct template" do
      expect(response).to render_template(:index)
    end

    it "responds wit the correct text" do
      expect(response.body).to include("Index from posts")
    end

    it " has the right response status" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    before :each do
      get "/users/1/posts/1"
    end

    it "renders the correct template" do
      expect(response).to render_template(:show)
    end

    it "responds with the correct text" do
      expect(response.body).to include("Show from posts")
    end

    it " has the right response status" do
      expect(response).to have_http_status(200)
    end
  end
end
