require "spec_helper"

class User
  def to_s
    @repr
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
    script user1, user2, nil

    expected = [:eq, "user 1"]
    script user1, user1, expected

    script User.new, {}, nil
    script User.new, Object.new, nil
  end

end

