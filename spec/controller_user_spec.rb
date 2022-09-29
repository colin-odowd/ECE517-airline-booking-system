require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  current_user = User.find_by_admin(true)

  describe "GET index" do
    it "assigns @users" do
      get(:index, session: { user_id: current_user.id })
      expect(assigns(:users)).to eq([current_user])
    end

    it "renders the index template" do
      get(:index, session: { user_id: current_user.id })
      expect(response).to render_template("index")
    end
  end

  describe "GET user" do
    it "renders the show template" do
      get(:show, params: { id: current_user.id }, session: { user_id: current_user.id })
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns a new user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET edit" do
    it "renders the edit template" do
      get(:edit, params: { id: current_user.id }, session: { user_id: current_user.id })
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        expect{
          post :create, user: User.attributes_for(:user)
        }.to change(User,:user).by(1)
      end
      
      it "redirects to the new contact" do
        post :create, user: User.attributes_for(:user)
        response.should redirect_to User.last
      end
    end 
  end

  describe "POST update" do
    it "renders the update" do
      get(:update, params: { id: current_user.id }, session: { user_id: current_user.id })
      expect(response).to render_template("update")
    end
  end

  describe "GET destroy user" do
    it "renders the destroy" do
      get(:destroy, session: { user_id: current_user.id })
      expect(response).to render_template("destroy")
    end
  end
end