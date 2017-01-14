module Lab42
  module Diff extend self

    def script lhs, rhs
      if lhs == rhs
        [:eq, lhs.to_s]
      elsif lhs.class == rhs.class
        script_by_kind(lhs,rhs)
      end
    end

    private

    def bag_difference lhs, rhs
      lhs.inject(0) do | sum, (lhk, lhv) |
        sum + [ lhv - rhs.fetch(lhk, 0), 0 ].max
      end
    end

    # The algorithm is outlined in the
    # "String Matching with Metric Trees Using an Approximate Distance"
    # paper by Ilaria Bartolini, Paolo Ciaccia, and Marco Patella.
    def bag_distance lhs, rhs
      bag1 = string_to_bag(lhs)
      bag2 = string_to_bag(rhs)

      [bag_difference(bag1, bag2), bag_difference(bag2, bag1)].max
    end

    def script_by_kind lhs, rhs
      case lhs.class
      when String

      end
    end

    def string_to_bag str
      str.chars.inject({}) do | bag, char |
        bag.update(char => 1){|_, o, _| o + 1}
      end
    end
  end
end
