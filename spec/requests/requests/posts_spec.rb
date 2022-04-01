require 'rails_helper'

RSpec.describe "Requests::Posts", type: :request do
  describe "GET /requests/posts" do
    it "works! (now write some real specs)" do
      get requests_posts_index_path
      expect(response).to have_http_status(200)
    end
  end
end
