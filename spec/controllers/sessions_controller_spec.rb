require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before(:each) {
    Employee.create(name: 'Admin', admin: true, employee_id: 1, password: 'password')
    session[:employee_id] = 1
  }

  describe "GET #new" do
    it "responds with a status code of 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the index template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "responds with a status code of 302" do
      post :create, { params: { employee: {admin: true, employee_id: 1, password: 'password' } } }
      expect(response).to have_http_status 302
    end

    it "renders the create template" do
      post :create, { params: { employee: {admin: true, employee_id: 1, password: 'password' } } }
      expect(response).should redirect_to("/")
    end

    it 'sets a flash notice upon failure' do
      post :create, { params: { employee: {admin: true, employee_id: 1, password: '' } } }
      expect(flash[:alert]).to match ["Your employee ID or password combination are incorrect."]
    end
  end

  describe "DELETE #destroy" do
    it "responds with a status code of 302" do
      delete :destroy, { params: { employee: {admin: true, employee_id: 1, password: 'password' } } }
      expect(response).to have_http_status 302
    end

    it "renders the create template" do
      delete :destroy, { params: { employee: {admin: true, employee_id: 1, password: 'password' } } }
      expect(response).should redirect_to("/login")
    end
  end
end
