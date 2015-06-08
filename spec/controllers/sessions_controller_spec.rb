require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user)}
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "sets a new user instance" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders a new session page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    context "successful login" do
      def valid_user_request 
        post :create, email: user.email, password: user.password
      end
      it "sets the user_id session variable" do
        valid_user_request
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirect to home page" do
        valid_user_request
        expect(response).to redirect_to( root_path )
      end
    end

    context "unsuccessful login" do
      def invalid_request
        post :create, email: user.email, password: user.password + "gibberish"
      end

      it "doesnt set a user_id session variable" do
        invalid_request
        expect(session[:user_id]).not_to be
      end

      it "redirects to new session path" do
        invalid_request
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "#destroy" do
    before{ 
      login(user) 
      delete :destroy, id: user.id
    }

    it "sets session[:user_id] to nil" do
      expect(session[:user_id]).not_to be
    end

    it "redirects to login page" do
      expect(response).to redirect_to(new_session_path)
    end
  end
end
