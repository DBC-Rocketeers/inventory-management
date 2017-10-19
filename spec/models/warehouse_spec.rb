require 'rails_helper'

RSpec.describe Warehouse, type: :model do

  let!(:seattle) { Warehouse.create(name: "Seattle") }
  let!(:houston) { Warehouse.create(name: "Houston") }
  let!(:nose) { Part.create(name: "Nose Cone", number: 1234) }
  let!(:flux) { Part.create(name: "Flux capacitor", number: 2345) }

  describe 'methods' do

    it 'returns an array of parts' do
      expect(seattle.inventory).to be_a Array
    end

    it 'returns an array include parts' do
      seattle.parts << nose
      seattle.parts << nose
      expect(seattle.inventory).to include nose
    end
    it "returns one of a part name" do
      seattle.parts << nose
      seattle.parts << nose
      expect(seattle.inventory.count).to eq 1
    end
  end
end
