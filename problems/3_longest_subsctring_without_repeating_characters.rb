# https://leetcode.com/problems/longest-substring-without-repeating-characters/

require_relative 'helper'

class Problem
  # @param {String} s
  # @return {Integer}
  def self.length_of_longest_substring(s)
    set = Set.new
    left = 0
    max = 0
    s.length.times do |right|
      while set.add?(s[right]).nil?
        set.delete(s[left])
        left += 1
      end

      max = [max, right - left + 1].max
    end

    max
  end
end

describe Problem do
  specify do
    expect(described_class.length_of_longest_substring('abcabcbb')).to eq(3)
    expect(described_class.length_of_longest_substring('bbbbb')).to eq(1)
    expect(described_class.length_of_longest_substring('pwwkew')).to eq(3)
    expect(described_class.length_of_longest_substring(' ')).to eq(1)
    expect(described_class.length_of_longest_substring('')).to eq(0)
    expect(described_class.length_of_longest_substring('au')).to eq(2)
    expect(described_class.length_of_longest_substring('baab')).to eq(2)
    expect(described_class.length_of_longest_substring('aab')).to eq(2)
    expect(described_class.length_of_longest_substring('dvdf')).to eq(3)
  end
end
