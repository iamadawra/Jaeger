require 'rails_helper'

RSpec.describe VideosController, type: :controller do


  describe "GET /search" do
    before :each do
      @video1 = create(:video, title: "Independent Day", is_in_competition: false, tags: "[war, English]", uploader_id: 1)
      @video2 = create(:video, title: "Spider Man", is_in_competition: true, competition_id: 1, tags: "[comic, English]", uploader_id: 2)
      @user1 = = create(:user, id: 1, first_name: "Uploader1")
      @user1 = = create(:user, id: 1, username: "Uploader2")
    end

    it "can search all contents" do
      skip("pending")
      get :search, mode: "all", keyword: "English"
      expect((assigns(:video)).to match_array([@video1, @video2])
    end

    it "can search content filtered by only video names" do
      skip("pending")
      get :search, mode: "vname", keyword: "Spider"
      expect((assigns(:video)).to match_array([@video2])
    end 

    it "can search content filtered by only username(user id)" do
      skip("pending")
      get :search, mode: "uname", keyword: "Uploader1"
      expect((assigns(:video)).to match_array([@video1])
    end 

    it "can search content filtered by only first_name(user id)" do
      skip("pending")
      get :search, mode: "uname", keyword: "Uploader1"
      expect((assigns(:video)).to match_array([@video2])
    end 

    it "can search content filtered by only tags names" do
      skip("pending")
      get :search, mode: "tag", keyword: "war"
      expect((assigns(:video)).to match_array([@video1])
    end

    //TODO: HAVE NOT CREATED SCHEMA FOR COMPETITION YET
    it "can search content filtered by competition" do
      skip("pending")
      get :search, mode: "competition", keyword: "1"
      expect((assigns(:video)).to match_array([@video1])
    end

    it "renders the :search_result template" do
      skip("pending")
      get :search
      expect(response).to render_template :search_result
    end
  end

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
      skip("pending")
      video = create(:video)
      post :upload, id: video
      expect(assigns(:video)).to be_a_new(Video)
    end

    context "with valid attributes" do
    	it "saves the new video to the db" do
        skip("pending")
    		expect{
    			post :upload,
    				video: attributes_for(:valid_video)
    		}.to change(Video, :count).by(1)
    	end

    	it "redirects to the video/show page" do
        skip("pending")
    		post :upload,
    			video: attributes_for(:valid_video)
    		expect(response).to redirect_to video_path(assigns[:video])
    	end 
    end
      
    context "if it is not logged in" do
      it "redirects to the root path" do
        skip("pending")
        post :upload, video: attributes_for(:video)
        expect(response).to redirect_to(root_path)
      end 
    end

    context "with invalid attributes" do
    	it "does not save the new video to the db" do
        skip("pending")
    		expect{
    			post :upload,
    				video: attributes_for(:invalid_video)
    		}.to_not change(Video, :count)
    	end

    	it "redirects back to the upload page" do
        skip("pending")
    		post :upload,
    			video: attributes_for(:invalid_video)
    		expect(response).to render_template :upload
    	end
    end
  end

end
