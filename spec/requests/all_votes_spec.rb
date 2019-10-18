require 'rails_helper'

RSpec.describe "AllVotes", type: :request do
  describe "GET /all_votes" do
    it "works! (now write some real specs)" do
      get all_votes_path
      expect(response).to have_http_status(200)
    end
  end
end
