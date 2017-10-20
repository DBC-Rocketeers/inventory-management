require 'rails_helper'

RSpec.describe Part, type: :model do
    let!(:seattle) { Warehouse.create(name: "Seattle") }
    let!(:houston) { Warehouse.create(name: "Houston") }
    let!(:nose) { Part.create(name: "Nose Cone", number: 1234) }
    let!(:nose2) { Part.create(name: "Nose Cone", number: 1234) }
    let!(:flux) { Part.create(name: "Flux capacitor", number: 2345) }

describe "methods" do
    it 'it returns the local count of multiple parts' do
      seattle.parts << nose
      seattle.parts << nose2
      seattle.parts << flux
      nose.reload
      expect(nose.local_count("Seattle")).to eq 2
    end

    it 'it returns the local count for a different instances of a part' do
      seattle.parts << nose
      seattle.parts << nose2
      seattle.parts << flux
      nose2.reload
      expect(nose2.local_count("Seattle")).to eq 2
    end

    it 'returns the local count of a part thats in 2 locations' do
      seattle.parts << nose
      seattle.parts << nose2
      seattle.parts << flux
      houston.parts << nose
      nose.reload
      expect(nose.local_count("Houston")).to eq 1
    end
  end
end
