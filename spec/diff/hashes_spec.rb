require "spec_helper"

RSpec.describe "script" do

  describe "hashes" do
    hash1 = (1..15).to_a
    hash1.delete(13)
    hash1 = hash1.zip(hash1).to_h
    hash2 = hash1.clone
    (5..10).each{ |e| hash2.delete(e) }
    hash2.update(12 => 32, 13 => 13)
    expected = [
      [:eq, "{"],
      [
        [:eq, "1 => 1"], [:eq, ", ", :eq, "2 => 2"], [:eq, ", ", :eq, "3 => 3"],
        [:eq, ", ", :eq, "4 => 4"], [:eq, ", ", :eq, "11 => 11"], [:eq, ", ", :eq, "14 => 14"],
        [:eq, ", ", :eq, "15 => 15"],
        [[:eq, ", "], [:eq, "12 => "], [:del, "1", :ins, "3", :eq, "2"]],
        [:del, ", ", :del, "5 => 5"], [:del, ", ", :del, "6 => 6"], [:del, ", ", :del, "7 => 7"],
        [:del, ", ", :del, "8 => 8"], [:del, ", ", :del, "9 => 9"], [:del, ", ", :del, "10 => 10"],
        [:ins, ", ", :ins, "13 => 13"],
      ],
      [:eq, "}"]
    ]
    script hash1, hash2, expected

    hash1 = {baz: 12}
    hash2 = {foo: 12, bar: 12, baz: 12}
    expected = [[:eq, "{"], [[:eq, "baz: 12"], [:ins, ", ", :ins, "bar: 12"], [:ins, ", ", :ins, "foo: 12"]], [:eq, "}"]]
    script hash1, hash2, expected
    expected = [[:eq, "{"], [[:eq, "baz: 12"], [:del, ", ", :del, "bar: 12"], [:del, ", ", :del, "foo: 12"]], [:eq, "}"]]
    script hash2, hash1, expected
    script hash1, {}, [[:eq, "{"], [[:del, "baz: 12"]], [:eq, "}"]]
    script Hash.new, hash1, [[:eq, "{"], [[:ins, "baz: 12"]], [:eq, "}"]]
    expected = [[:eq, "{"], [[:del, "baz: 12"], [:ins, "foo: 12"]], [:eq, "}"]]
    script hash1, {foo: 12}, expected

    script Hash.new, {}, [eq: "{"]
    
  end

end

