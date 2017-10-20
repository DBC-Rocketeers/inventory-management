require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  before(:each) {
    Employee.create(name: 'Admin', admin: true, employee_id: 1, password: 'password')
    session[:employee_id] = 1

    Warehouse.create!(name: "Seattle")
    Order.create!(warehouse_id: 1)
  }

  describe "GET #new" do
    it "responds with a status code of 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "creates an array of warehouse instances" do
      get :new
      expect(assigns(:warehouse)).to be_a ActiveRecord::Relation
    end
  end

  describe "POST #create" do
    it "responds with a status code of 302" do
      post :create, { params: { order: { name: "Seattle" } } }
      expect(response).to have_http_status 302
    end

    it "creates an instance of order" do
      get :create, { params: { order: { name: "Seattle" } } }
      expect(assigns(:order)).to be_a Order
    end
  end

  describe "GET #show" do
    it "responds with a status code of 200" do
      get :show, {params:{ id: 1 }}
      expect(response).to have_http_status 200
    end
  end

  describe 'PUT #update' do
    it "returns a 302 status" do
      put :update, { params: { id: 1, part_name: "Nose Cone", part_number: 1234, ordered_quantity: 2 } }
      expect(response).to have_http_status 302
    end

    xit 'takes params to create an entry' do
      put :update, { params: { id: 1, part_name: "Nose Cone", part_number: 1234, ordered_quantity: 2 } }
      expect()
    end
  end
end
