require 'rails_helper'

RSpec.describe WarehousesController, type: :controller do
  before(:each) {
    Employee.create(name: 'Admin', admin: true, employee_id: 1, password: 'password')
    session[:employee_id] = 1

    seattle = Warehouse.create(name: "Seattle")
    houston = Warehouse.create(name: "Houston")

    seattle.parts << Part.create(name: "Nose Cone", number: 1234)
    seattle.parts << Part.create(name: "Flux capacitor", number: 2345)
    seattle.parts << Part.create(name: "Oxidizer", number: 3456)
    seattle.parts << Part.create(name: "Fuel Pump", number: 4567)
    houston.parts << Part.create(name: "Space Recliners", number: 5678)
    houston.parts << Part.create(name: "Fuel Pump", number: 4567)
  }
  describe "GET #index" do
    it "responds with a status code of 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the entire collection of warehouses as @warehouses" do
      get :index
      expect(assigns(:warehouses).count).to be 2
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "responds with a status code of 200" do
      get :show, { id: 1}
      expect(response).to have_http_status 200
    end

    it "assigns the entire inventory of warehouses as @inventory" do
      get :show, { id: 1}
      expect(assigns(:warehouses).count).to be 4
    end

    it "renders the index template" do
      get :show, { id: 1}
      expect(response).to render_template(:show)
    end
  end
end
