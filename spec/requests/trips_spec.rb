require 'rails_helper'

RSpec.describe "Trips", :type => :request do
  describe "GET /trips" do
    it "works! (now write some real specs)" do
      get trips_path
      expect(response.status).to be(200)
    end
  end
end
