require "spec_helper"

RSpec.describe "script" do
  describe "strings" do
    string1 = "fox hops over \"the dog"
    string2 = "fox jumps over the lazy cat"

    script string1, string2, [
        :eq, '"',
        [:eq, "fox ", :del, "ho", :ins, "jum", :eq, "ps over ", :del, "\\\"", :eq, "the ", :del, "dog", :ins, "lazy cat"],
        :eq, '"',
      ]
    script string1, [1, 2], nil
    script "aaa", "bbb", nil
    script "aaa", "baa", [
        :eq, '"',
        [:eq, "fox ", :del, "ho", :ins, "jum", :eq, "ps over ", :del, "\\\"", :eq, "the ", :del, "dog", :ins, "lazy cat"],
        :eq, '"',
      ]
    script "", "", [:eq, '"']

  end
end
