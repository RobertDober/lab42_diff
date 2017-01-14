require "spec_helper"

def stb(*args); Lab42::Diff.send(:string_to_bag, *args) end

RSpec.describe "string_to_bag" do
  context "empty" do
    it{ expect( stb("") ).to eq({}) }
  end

  context "simple" do
    it { expect(stb("abCè")).to eq({"a" => 1, "b" => 1, "C" => 1, "è" => 1})  }
    it { expect(stb("aba Cè")).to eq({"a" => 2, "b" => 1, "C" => 1, "è" => 1, " " => 1})  }
  end
end
