module Lab42
  module Diff
    # This comes from Elixir's source not ExUnit, same LICENCE, and
    # same copyright holder, so there  should not be any problem here.
    module Myers extend self
      def difference lhs, rhs
        cl = lhs.chars
        cr = rhs.chars
        ll = lhs.length
        lr = rhs.length
      end

      private

      def find_script(envelope, max, paths)
        return if envelope > max
        diags, edits_or_paths =  each_diagonal(-envelope, envelope, paths, [])
        if diags == :done
          compact_reverse(edits, [])
        else
          find_script(envelope + 1, max, paths)
        end
      end

      def follow_snake(x, y, lchars, rchars)
        commons  = get_commons(lchars, rchars)
        advanced = commons.length
        if advanced == lchars.length && advanced == rchars.length
          [:done, commons.flatten]
        else
          [:cont, [x + advanced, y + advanced, lchars.drop(advanced), rchars.drop(advanced), commons.flatten]]
        end
      end

      def get_commons(lchars, rchars)
        lchars.zip(rchars).inject([]) do | result, (lchar, rchar) |
          return result unless lchar == rchar
          result << [:eq, lchar]
        end
      end

    end
  end
end
