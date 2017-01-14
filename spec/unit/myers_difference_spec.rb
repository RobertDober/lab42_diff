require "spec_helper"

def mdiff(lhs, rhs); Lab42::Diff.send(:myers_difference, lhs, rhs) end

# Myers difference specs copied from Elixir source c.f. LICENCE
RSpec.describe "myers difference" do 
  it { expect( mdiff("", "abc") ).to eq( [:ins, "abc"] ) }
  it { expect( mdiff("abc", "") ).to eq( [:del, "abc"] ) }
  it { expect( mdiff("", "") ).to eq( [] ) }
  it { expect( mdiff("abc", "abc") ).to eq( [:eq, "abc"] ) }
  it{ expect( mdiff("abc", "aйbc") ).to eq( [:eq, "a", :ins, "й", :eq, "bc"] ) }
  it { expect( mdiff("aйbc", "abc") ).to eq( [:eq, "a", :del, "й", :eq, "bc"] ) }
end
