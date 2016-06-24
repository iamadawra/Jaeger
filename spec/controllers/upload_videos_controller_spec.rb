require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe UploadVideosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # UploadVideo. As you add validations to UploadVideo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UploadVideosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all upload_videos as @upload_videos" do
      upload_video = UploadVideo.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:upload_videos)).to eq([upload_video])
    end
  end

  describe "GET #show" do
    it "assigns the requested upload_video as @upload_video" do
      upload_video = UploadVideo.create! valid_attributes
      get :show, {:id => upload_video.to_param}, valid_session
      expect(assigns(:upload_video)).to eq(upload_video)
    end
  end

  describe "GET #new" do
    it "assigns a new upload_video as @upload_video" do
      get :new, {}, valid_session
      expect(assigns(:upload_video)).to be_a_new(UploadVideo)
    end
  end

  describe "GET #edit" do
    it "assigns the requested upload_video as @upload_video" do
      upload_video = UploadVideo.create! valid_attributes
      get :edit, {:id => upload_video.to_param}, valid_session
      expect(assigns(:upload_video)).to eq(upload_video)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new UploadVideo" do
        expect {
          post :create, {:upload_video => valid_attributes}, valid_session
        }.to change(UploadVideo, :count).by(1)
      end

      it "assigns a newly created upload_video as @upload_video" do
        post :create, {:upload_video => valid_attributes}, valid_session
        expect(assigns(:upload_video)).to be_a(UploadVideo)
        expect(assigns(:upload_video)).to be_persisted
      end

      it "redirects to the created upload_video" do
        post :create, {:upload_video => valid_attributes}, valid_session
        expect(response).to redirect_to(UploadVideo.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved upload_video as @upload_video" do
        post :create, {:upload_video => invalid_attributes}, valid_session
        expect(assigns(:upload_video)).to be_a_new(UploadVideo)
      end

      it "re-renders the 'new' template" do
        post :create, {:upload_video => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested upload_video" do
        upload_video = UploadVideo.create! valid_attributes
        put :update, {:id => upload_video.to_param, :upload_video => new_attributes}, valid_session
        upload_video.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested upload_video as @upload_video" do
        upload_video = UploadVideo.create! valid_attributes
        put :update, {:id => upload_video.to_param, :upload_video => valid_attributes}, valid_session
        expect(assigns(:upload_video)).to eq(upload_video)
      end

      it "redirects to the upload_video" do
        upload_video = UploadVideo.create! valid_attributes
        put :update, {:id => upload_video.to_param, :upload_video => valid_attributes}, valid_session
        expect(response).to redirect_to(upload_video)
      end
    end

    context "with invalid params" do
      it "assigns the upload_video as @upload_video" do
        upload_video = UploadVideo.create! valid_attributes
        put :update, {:id => upload_video.to_param, :upload_video => invalid_attributes}, valid_session
        expect(assigns(:upload_video)).to eq(upload_video)
      end

      it "re-renders the 'edit' template" do
        upload_video = UploadVideo.create! valid_attributes
        put :update, {:id => upload_video.to_param, :upload_video => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested upload_video" do
      upload_video = UploadVideo.create! valid_attributes
      expect {
        delete :destroy, {:id => upload_video.to_param}, valid_session
      }.to change(UploadVideo, :count).by(-1)
    end

    it "redirects to the upload_videos list" do
      upload_video = UploadVideo.create! valid_attributes
      delete :destroy, {:id => upload_video.to_param}, valid_session
      expect(response).to redirect_to(upload_videos_url)
    end
  end

end