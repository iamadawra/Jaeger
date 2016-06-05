require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  describe "GET /show" do
    it "assigns the requested video to @video" do
      video = create(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end

    it "renders the :show template" do
      video = create(:video)
      get :show, id: video.id
      expect(response).to render_template(:show)
    end
  end

  describe "GET /index" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
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

    	it "redirects to the video/show page" do
    		post :upload,
    			video: attributes_for(:valid_video)
    		expect(response).to redirect_to video_path(assigns[:video])
    	end 
    end
      
    context "if it is not logged in" do
      it "redirects to the root path" do
        post :upload, video: attributes_for(:video)
        expect(response).to redirect_to(root_path)
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
