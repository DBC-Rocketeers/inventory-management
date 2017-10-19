require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  before(:each) {
    Employee.create(name: 'Admin', admin: true, employee_id: 1, password: 'password')
    session[:employee_id] = 1
  }

  describe "GET #new" do
    it "responds with a status code of 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "creates an instance of employee" do
      get :new
      expect(assigns(:employee)).to be_a Employee
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET #create" do
    it "responds with a status code of 200" do
      post :create, { params: { employee: { name: 'Admin', admin: true, employee_id: 1, password: 'password' } } }
      expect(response).to have_http_status 200
    end

    it "creates an instance of employee" do
      post :create, { params: { employee: { name: 'Admin', admin: true, employee_id: 1, password: 'password' } } }
      expect(assigns(:employee)).to be_a Employee
    end

    it "renders the create template" do
      post :create, { params: { employee: { name: 'Admin', admin: true, employee_id: 1, password: 'password' } } }
      expect(response).to render_template(:create)
    end

    it 'sets a flash notice upon success' do
      post :create, { params: { employee: { name: '2nd Admin', admin: true, employee_id: 2, password: 'password' } } }
      expect(flash[:notice]).to match ["You have successfully added new employee, 2nd Admin."]
    end

    it 'sets a flash notice upon failure' do
      post :create, { params: { employee: {admin: true, employee_id: 1, password: '' } } }
      expect(flash[:alert]).to match ["Name can't be blank", "Employee has already been taken", "Password can't be blank"]
    end
  end
end
