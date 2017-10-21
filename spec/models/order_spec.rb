require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:warehouse) { Warehouse.create!(name: "Seattle") }
  let!(:part) { Part.create!(name: "Flux capacitor", number: 2345) }
  let!(:order) { Order.create!(warehouse_id: 1) }
  describe 'methods' do
    it "creates a new entry" do
      expect{ order.add_entry({name: "Nose Cone", number: 1234, quantity: 2}) }.to change{ order.entries.count }.by 1
    end

    it "creates a new entry when a part already exists" do
      expect{ order.add_entry({name: "Flux capacitor", number: 2345, quantity: 1}) }.to change{ order.entries.count }.by 1
    end
  end
end
