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
end