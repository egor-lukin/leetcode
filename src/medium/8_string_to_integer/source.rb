require 'byebug'

# https://leetcode.com/problems/string-to-integer-atoi/submissions/
class MediumStringToInteger
  DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  MAX_NEGATIVE = '2147483648'
  MAX_POSITIVE = '2147483647'

  def compare num1, num2
    return 1 if num1.size > num2.size
    return -1 if num1.size < num2.size

    (0..(num1.size - 1)).each do |i|
      return 1 if num1[i] > num2[i]
      return -1 if num1[i] < num2[i]

      next
    end

    0
  end

  def digit? sym
    DIGITS.include? sym
  end

  # @param {String} s
  # @return {Integer}
  def my_atoi(str)
    sign = '+'
    digits = ''
    first_whitespaces = true
    first_zero = true
    (0..(str.size - 1)).each do |i|
      if str[i] == ' ' && first_whitespaces
        next
      end

      if first_whitespaces && (str[i] == '+' || str[i] == '-')
        first_whitespaces = false
        sign = str[i]
        next
      end

      if str[i] == '0' && first_zero
        first_whitespaces = false
        next
      end

      if digit?(str[i])
        first_zero = false
        first_whitespaces = false
        digits += str[i]
        next
      end

      unless digit?(str[i])
        break
      end
    end

    return 0 if digits.empty?

    if compare(digits, MAX_POSITIVE) == 1 && sign != '-'
      return MAX_POSITIVE.to_i
    end

    if compare(digits, MAX_NEGATIVE) == 1 && sign == '-'
      return -(MAX_NEGATIVE.to_i)
    end

    if sign == '-'
      return -(digits.to_i)
    end

    digits.to_i
  end
end
