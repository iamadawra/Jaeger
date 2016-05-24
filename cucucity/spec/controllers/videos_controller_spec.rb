require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  describe "GET /play" do
    it "renders the :video_box template" do
      video = create(:video)
      get :play, id: video
      expect(response).to render_template(:video_box)
    end

    it "renders the :video_list template" do
      video = create(:video)
      get :play, id: video
      expect(response).to render_template(:video_list)
    end
  end

  describe "POST /upload" do
    it "assigns a new Video to @video" do
      video = create(:video)
      post :upload, id: video
      expect(assigns(:video)).to be_a_new(Video)
    end

    context "with valid attributes" do
    	it "saves the new video to the db" do
    		expect{
    			post :upload,
    				video: attributes_for(:valid_video)
    		}.to change(Video, :count).by(1)
    	end

    	it "redirects to the video#{show} page" do
    		post :upload,
    			video: attributes_for(:valid_video)
    		expect(response).to redirect_to video_path(assigns[:video])
    	end 
    end
      
    context "if it is not logged in" do
      it "is invalid to upload video" do
           
      end 
    end

    context "with invalid attributes" do
    	it "does not save the new video to the db" do
    		expect{
    			post :upload,
    				video: attributes_for(:invalid_video)
    		}.to_not change(Video, :count)
    	end

    	it "redirects back to the upload page" do
    		post :upload,
    			video: attributes_for(:invalid_video)
    		expect(response).to render_template :upload
    	end
    end
  end

end
