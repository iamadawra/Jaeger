require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /new" do
    it "assigns a new User to @user" do
      skip("pending")
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      skip("pending")
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET /edit" do
    it "assigns the requested User to @user" do
      skip("pending")
      user = create(:user)
      get :edit, id: user.id
      expect(assigns(:user)).to eq(user)
    end

    it "renders the :edit template" do
      skip("pending")
      get :edit
      expect(response).to render_template(:edit)
    end
  end

  describe "PUT /update" do
    before :each do
      @user = create(:user, first_name: "hello", last_name: "world")
    end

    context "valid attributes" do
      it "finds the requested @user" do
        skip("pending")
        put :update, id: @user.id, user: attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end

      it "changes @user's atributes" do
        skip("pending")
        put :update, id: @user.id, user: attributes_for(:user, first_name: "bye", last_name: "test")
        @user.reload
        expect(@user.first_name).to eq("bye")
        expect(@user.last_name).to eq("test")
      end

      it "redirects to the updated user" do
        skip("pending")
        put :update, id: @user.id, user: attributes_for(:user)
        expect(response).to redirect_to(@user)
      end
    end

    context "invalid attributes" do
      it "does not change @user's attributes" do
        skip("pending")
        put :update, id: @user.id, user: attributes_for(:user, first_name: "bye", last_name: nil)
        @user.reload
        expect(@user.first_name).to eq("hello")
        expect(@user.last_name).to eq("world")
      end

      it "render the :edit template" do
        skip("pending")
        put :update, id: @user.id, user: attributes_for(:invalid_user)
        expect(response).to render_template(:edit)
      end      
    end
  end

  describe "POST /create" do
    context "with valid attributes" do
      it "saves the new user into database" do
        skip("pending")
        expect {
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to root path" do
        skip("pending")
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid attributes" do
      it "does not save the new user into database" do
        skip("pending")
        expect {
          post :create, user: attributes_for(:invalid_user)
        }.to_not change(User, :count)
      end

      it "re-render the :register template" do
        skip("pending")
        post :create, user: attributes_for(:user)
        expect(response).to render_template(:register)
      end
    end
  end

  describe "POST /login" do
    before :each do
      @user = create(:user, email: "test@cucu.com", password: "pwd")
    end

    it "finds the requested @user" do
      skip("pending")
      put :login, id: @user.id, user: attributes_for(:user)
      expect(assigns(:user)).to eq(@user)
    end

    it "redirects to root path" do
      skip("pending")
      post :create, user: attributes_for(:user)
      expect(response).to redirect_to(root_path)
    end
  end
end