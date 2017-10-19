require 'rails_helper'

RSpec.describe WarehousesController, type: :controller do
  before(:each) {
    seattle = Warehouse.create(name: "Seattle")

    seattle.parts << Part.create(name: "Nose Cone", number: 1234)
    seattle.parts << Part.create(name: "Flux capacitor", number: 2345)
    seattle.parts << Part.create(name: "Oxidizer", number: 3456)
    seattle.parts << Part.create(name: "Fuel Pump", number: 4567)
  }
  describe "GET #index" do
    it "responds with a status code of 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "assigns the entire inventory as @inventory" do
      get :index
      expect(assigns(:inventory).count).to be 4
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
