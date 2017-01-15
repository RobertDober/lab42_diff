require "spec_helper"

def fsn(lc, rc, ls, rs); Lab42::Diff::Myers.send(:follow_snake, lc, rc, ls.chars, rs.chars) end

RSpec.describe "follow_snake" do
  
  it { expect(fsn(0,0, "", "")).to eq([:done, []]) }
  it { expect(fsn(3, 1, "a", "")).to eq([:cont, [ 3, 1, ["a"], [], [] ]]) }

  it { expect(fsn(3, 1, "abd", "abc")).to eq( [ :cont, [ 5, 3, ["d"], ["c"], [:eq, "a", :eq, "b"] ] ] ) }
  it { expect(fsn(0, 1, "abd", "ab")).to eq( [ :cont, [ 2, 3, ["d"], [], [:eq, "a", :eq, "b"] ] ] ) }
  it { expect(fsn(2, 0, "ab", "abs")).to eq( [ :cont, [ 4, 2, [], ["s"], [:eq, "a", :eq, "b"] ] ] ) }
  it { expect(fsn(2, 0, "ab", "ab")).to eq( [ :done, [:eq, "a", :eq, "b"] ] ) }

end
