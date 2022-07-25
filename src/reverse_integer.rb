require 'byebug'

# https://leetcode.com/problems/reverse-integer/
class ReverseInteger
  MAX_NEGATIVE = 2147483648
  MAX_POSITIVE = 2147483647

  # @param {Integer} x
  # @return {Integer}
  def reverse x
    rev_x = 0
    origin_x = x
    x = x.abs
    while (x >= 1 && x > 0) || (x <= -1 && x < 0)

      mod = x % 10
      x = x / 10

      rev_x = rev_x * 10 + mod
      return 0 if (rev_x > MAX_POSITIVE && origin_x > 0) ||
                  (rev_x > MAX_NEGATIVE && origin_x < 0)
    end

    return -rev_x if origin_x < 0

    rev_x
  end
end
