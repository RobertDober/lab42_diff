require "spec_helper"

class User
  def to_s
    repr
  end

  private

  def initialize repr="a user"
    @repr = repr
  end

end

RSpec.describe "script" do

  describe "objects" do
    user1 = User.new("user 1")
    user2 = User.new("user 2")
    expected = [[:eq, "User<"], [[[:eq, "user"], [:del, "1", :ins, "2"]]], [:eq, "}"]]
    script user1, user2, expected
    script User.new, {}, nil
    script User.new, Object.new, nil
  end

end

