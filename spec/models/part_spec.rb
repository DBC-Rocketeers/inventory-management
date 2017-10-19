require 'rails_helper'

RSpec.describe Part, type: :model do

    let!(:nose) { Part.create(name: "Nose Cone", number: 1234) }
    let!(:nose2) { Part.create(name: "Nose Cone", number: 1234) }
    let!(:flux) { Part.create(name: "Flux capacitor", number: 2345) }


  describe "methods" do
    it 'it returns the global count of multiple parts' do
      expect(nose.global_count).to eq 2
    end
    it 'it returns the global count for a different instances of a part' do
      expect(nose2.global_count).to eq 2
    end
    it 'returns the global count of a single instance of a part' do
      expect(flux.global_count).to eq 1
    end
  end
end
