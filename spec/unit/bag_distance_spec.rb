require "spec_helper"

def bgd(*args); Lab42::Diff.send(:bag_distance, *args) end

RSpec.describe "bag_distance" do
  context "= zero" do
    it { expect(bgd("","")).to be_zero }
    it "identical" do
      expect( bgd("andé","andé") ).to be_zero
    end
    it "permutations" do
      expect( bgd("andé","néad") ).to be_zero
    end
  end

  context "> zero" do
    it { expect( bgd("a", "") ).to eq( 1 ) }
    it { expect( bgd("a", "abb" ) ).to eq( 2 ) }
    it { expect( bgd("adef", "abb" ) ).to eq( 3 ) }
    it { expect( bgd("ade", "abb" ) ).to eq( 2 ) }
    it { expect( bgd("ade  ", "abb" ) ).to eq( 4 ) }
    it { expect( bgd("de  a", "abb" ) ).to eq( 4 ) }
    it { expect( bgd("d e a", "abb" ) ).to eq( 4 ) }
    it { expect( bgd("d e a", "bab" ) ).to eq( 4 ) }
  end

end
