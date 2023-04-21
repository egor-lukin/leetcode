# https://leetcode.com/problems/longest-substring-without-repeating-characters/

require_relative 'helper'

class Problem
  # @param {String} s
  # @return {Integer}
  def self.length_of_longest_substring(s)
    return 0 if s == ''

    letters = {}
    max = 1
    only_uniq_letters = true
    s.split('').each_with_index do |sym, idx|
      # binding.pry
      if letters[sym].nil?
        letters[sym] = idx
      else
        only_uniq_letters = false
        prev_idx = letters[sym]
        distance = idx - prev_idx
        max = distance if distance > max

        letters[sym] = idx
      end
    end

    return s.size if only_uniq_letters

    max
  end
end

describe Problem do
  specify do
    # expect(described_class.length_of_longest_substring('abcabcbb')).to eq(3)
    # expect(described_class.length_of_longest_substring('bbbbb')).to eq(1)
    # expect(described_class.length_of_longest_substring('pwwkew')).to eq(3)
    # expect(described_class.length_of_longest_substring(' ')).to eq(1)
    # expect(described_class.length_of_longest_substring('')).to eq(0)
    # expect(described_class.length_of_longest_substring('au')).to eq(2)
    expect(described_class.length_of_longest_substring('baab')).to eq(2)
    # expect(described_class.length_of_longest_substring('aab')).to eq(2)
  end
end
