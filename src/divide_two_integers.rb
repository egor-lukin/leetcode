require 'byebug'

class DivideTwoIntegers
  MAX_NEGATIVE = -2147483648
  MAX_POSITIVE = 2147483647

  def detect_sign(dividend, divisor)
    return '-' if (dividend < 0 && divisor > 0) ||
                  (dividend > 0 && divisor < 0)

    '+'
  end

  # @param {Integer} dividend
  # @param {Integer} divisor
  # @return {Integer}
  def divide(dividend, divisor)
    sign = detect_sign(dividend, divisor)
    if divisor == 1 || divisor == -1
      return MAX_POSITIVE if sign == '+' && dividend == MAX_NEGATIVE

      return dividend.abs if sign == '+'
      return -(dividend.abs) if sign == '-'
    end

    i = 0
    dividend = dividend.abs
    divisor = divisor.abs
    while dividend >= divisor
      dividend = dividend - divisor
      i += 1
      if i >= MAX_POSITIVE && sign(o_dividend, divisor)
      end
    end

    return i if sign == '+'
    return -i if sign == '-'
  end
end
