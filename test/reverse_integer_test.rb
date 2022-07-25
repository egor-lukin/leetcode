require 'minitest/autorun'
require 'byebug'
require_relative '../src/reverse_integer.rb'

class ReverseIntegerTest < Minitest::Test
  def test_1
    algorithm = ReverseInteger.new
    expected = 321
    actual = algorithm.reverse 123

    assert_equal expected, actual
  end

  def test_2
    algorithm = ReverseInteger.new

    assert_equal -321, algorithm.reverse(-123)
  end

  def test_3
    algorithm = ReverseInteger.new

    assert_equal 21, algorithm.reverse(120)
  end

  def test_4
    algorithm = ReverseInteger.new

    assert_equal 0, algorithm.reverse(2147483648)
  end

  def test_5
    algorithm = ReverseInteger.new

    assert_equal 463847412, algorithm.reverse(214748364)
  end
end
