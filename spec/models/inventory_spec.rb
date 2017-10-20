require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let!(:seattle) { Warehouse.create(name: "Seattle") }
  let!(:houston) { Warehouse.create(name: "Houston") }
  let!(:nose) { Part.create(name: "Nose Cone", number: 1234) }
  let!(:flux) { Part.create(name: "Flux capacitor", number: 2345) }

  describe "methods" do
    it 'it returns the global count of multiple parts' do
      seattle.parts << nose
      houston.parts << nose
      entry = Inventory.first
      expect(entry.global_count).to eq 2
    end

    it 'it returns the global count for a different instances of a part' do
      seattle.parts << nose
      houston.parts << nose
      entry = Inventory.last
      expect(entry.global_count).to eq 2
    end

    it 'returns the global count of a single instance of a part' do
      seattle.parts << flux
      entry = Inventory.last
      expect(entry.global_count).to eq 1
    end
  end
end
