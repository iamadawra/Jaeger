require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #videos" do
    it "returns http success" do
      get :videos
      expect(response).to have_http_status(:success)
    end
  end

end
