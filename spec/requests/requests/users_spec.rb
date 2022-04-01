require 'rails_helper'

RSpec.describe "Requests::Users", type: :request do
  describe "GET /requests/users" do
    it "works! (now write some real specs)" do
      get requests_users_index_path
      expect(response).to have_http_status(200)
    end
  end
end
