module Lab42
  module Diff extend self

    def script(lhs, rhs)
      if lhs == rhs
        [:eq, lhs.to_s]
      elsif lhs.class == rhs.class
        script_by_kind(lhs,rhs)
      end
    end

    private

    def script_by_kind(lhs, rhs)
      case lhs.class
      when String

      end
    end
  end
end
