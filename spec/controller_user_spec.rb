require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET index" do
    current_user = User.find_by_admin(true)

    it "assigns @users" do
      get(:index, session: { :user_id => current_user.id })
      expect(assigns(:users)).to eq([current_user])
    end

    it "renders the index template" do
      get(:index, session: { :user_id => current_user.id })
      expect(response).to render_template("index")
    end
  end
end