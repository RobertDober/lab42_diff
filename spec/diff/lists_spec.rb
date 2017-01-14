require "spec_helper"


def itself; @__itself__ ||= Object.new end

RSpec.describe "script" do

  describe "lists" do
    list1 = ["Tvo", nil, :ok, [], :ok]
    list2 = ["Two", :ok, itself(), [true]]
    expected = [
      [:eq, "["],
      [
        [[:eq, '"'], [:eq, "T", :del, "v", :ins, "w", :eq, "o"], [:eq, '"']], [:eq, ", "],
        [:del, "nil"], [:del, ", "],
        [:eq, ":ok"], [:eq, ", "],
        [:ins, itself().inspect], [:ins, ", "],
        [[:eq, "{"], [[ins: "true"]], [:eq, "}"]], [:del, ", "], [:del, ":ok"]
      ],
      [:eq, "]"]
    ]
    script list1, list2, expected

    list1 = [1, "2", 1]
    list2 = [1, 1, 2]
    expected = [
      [:eq, "["],
      [:eq, "1", :eq, ", ", :del, '"2"', :del, ", ", :eq, "1", :ins, ", ", :ins, "2"],
      [:eq, "]"]
    ]
    script list1, list2, expected

    list1 = [1, 1, "1", 2]
    list2 = [1, 1, 2]
    expected = [
      [:eq, "["],
      [:eq, "1, 1", :eq, ", ", :del, '"1"', :del, ", ", :eq, "2"],
      [:eq, "]"]
    ]
    script list1, list2, expected

    list1 = [1, 2]
    list2 = [1, 1, 2]
    expected = [
      [:eq, "["],
      [[:eq, "1"], [:eq, ", "], [:del, "2", :ins, "1"], [:ins, ", "], [:ins, "2"]],
      [:eq, "]"]
    ]
    script list1, list2, expected

    list1 = []
    list2 = [1, 2]
    expected = [[:eq, "["], [:ins, "1, 2"], [:eq, "]"]]
    script list1, list2, expected

    list1 = [1, 2]
    list2 = []
    expected = [[:eq, "["], [:del, "1, 2"], [:eq, "]"]]
    script list1, list2, expected

    script [], [], [:eq, "[]"] 
  end

end
