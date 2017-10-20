require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:warehouse) { Warehouse.create!(name: "Seattle") }
  let!(:order) { Order.create!(warehouse_id: 1) }
  describe 'methods' do
    it "creates a new entry" do
      expect{ order.add_entry("Nose Cone", 1234, 2) }.to change{ order.entries.count }.by 1
    end
  end
end
