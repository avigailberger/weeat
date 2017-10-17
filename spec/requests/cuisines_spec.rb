require 'rails_helper'

RSpec.describe "Cuisines", type: :request do
  describe "GET /cuisines" do
    it "works! (now write some real specs)" do
      get cuisines_path
      expect(response).to have_http_status(200)
    end
  end
end
