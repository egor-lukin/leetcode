require 'minitest/autorun'
require_relative './source.rb'

class MediumStringToIntegerTest < Minitest::Test
  def test_1
    algorithm = MediumStringToInteger.new
    expected = 42
    actual = algorithm.my_atoi "42"

    assert_equal expected, actual
  end

  def test_2
    algorithm = MediumStringToInteger.new
    expected = -42
    actual = algorithm.my_atoi "   -42"

    assert_equal expected, actual
  end

  def test_3
    algorithm = MediumStringToInteger.new
    expected = 4193
    actual = algorithm.my_atoi "4193 with words"

    assert_equal expected, actual
  end

  def test_4
    algorithm = MediumStringToInteger.new
    expected = 0
    actual = algorithm.my_atoi "wrong word"

    assert_equal expected, actual
  end

  def test_5
    algorithm = MediumStringToInteger.new
    expected = -2147483648
    actual = algorithm.my_atoi "   -2147483649"

    assert_equal expected, actual
  end

  def test_5
    algorithm = MediumStringToInteger.new
    expected = 12345678
    actual = algorithm.my_atoi "  0000000000012345678"

    assert_equal expected, actual
  end
end
