require 'minitest/autorun'
require 'byebug'
require_relative '../src/divide_two_integers.rb'

class DivideTwoIntegersTest < Minitest::Test
  def test_1
    algorithm = DivideTwoIntegers.new

    assert_equal 3, algorithm.divide(10, 3)
  end

  def test_2
    algorithm = DivideTwoIntegers.new

    assert_equal -2, algorithm.divide(7, -3)
  end

  def test_3
    algorithm = DivideTwoIntegers.new

    assert_equal 6, algorithm.divide(-42, -7)
  end

  def test_4
    skip
    algorithm = DivideTwoIntegers.new

    assert_equal 2147483647, algorithm.divide(-2147483648, -1)
  end

  def test_5
    skip
    algorithm = DivideTwoIntegers.new

    assert_equal 2147483647, algorithm.divide(2147483647, 2)
  end
end
