require 'minitest/autorun'
require 'byebug'
require_relative '../src/longest_palindromic_substring.rb'

class LongestPalindromicSubstringTest < Minitest::Test
  def test_1
    skip
    algorithm = LongestPalindromicSubstring.new
    expected = 'aba'
    actual = algorithm.longest_palindrome 'aba'

    assert_equal expected, actual
  end
end
