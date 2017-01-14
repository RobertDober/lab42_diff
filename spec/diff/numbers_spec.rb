require "spec_helper"

RSpec.describe "script" do

  describe "numbers" do
    int1 = 491512235
    int2 = 490512035
    script int1, int2, [:eq, "49", :del, "1", :ins, "0", :eq, "512", :del, "2", :ins, "0", :eq, "35"]
    script int1, int2, [:eq, "49", :del, "1", :ins, "0", :eq, "512", :del, "2", :ins, "0", :eq, "35"]
    script 42.0, 42.3, [:eq, "4", :del, "2", :ins, "3", :eq, ".0"]
    script int1, 43.0, nil
  end

end
