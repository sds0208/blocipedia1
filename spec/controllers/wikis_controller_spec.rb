require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:user) { User.create!(email: "user@example.com", password: "password") }
  let(:my_wiki) { Wiki.create!(title: "Wiki Title", body: "This is a wiki body. asdf asdf asdf asdf asdf asdf.", user: user) }

  before do
    sign_in(user)
  end  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end  
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: my_wiki.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, params: { id: my_wiki.id }
      expect(response).to render_template :show
    end  
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
  end  

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: { id: my_wiki.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, params: { id: my_wiki.id }
      expect(response).to render_template :edit
    end  
  end
end
