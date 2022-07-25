require 'byebug'

class LongestPalindromicSubstring

  # @param {String} s
  # @return {String}
  def longest_palindrome(str)
    cache = {}
    max_p_indexes = [0, 0]
    (0..(str.size - 1)).each do |p_size|
      (1..(str.size - p_size)).each do |start_index|
        end_index = start_index + p_size
        if p_size == 0 && str[start_index - 1] == str[end_index]
        end
        if cache[[start_index, end_index]] && str[start_index - 1] == str[end_index + 1]
          cache[[start_index - 1, end_index + 1]] = true
          max = [start_index - 1, end_index + 1]
        end
      end
    end

    str.slice(max_p_indexes)
  end

  def palindrome?(s, i, j)
    (0..((j - i) / 2)).each do |k|
      if s[i + k] != s[j - k]
        return false
      end
    end

    true
  end
end
