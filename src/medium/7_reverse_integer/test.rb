require 'minitest/autorun'
require_relative './source.rb'

class MediumReverseIntegerTest < Minitest::Test
  def test_1
    skip
    algorithm = MediumReverseInteger.new

    assert_equal 321, algorithm.reverse(123)
  end

  def test_2
    skip
    algorithm = MediumReverseInteger.new

    assert_equal -321, algorithm.reverse(-123)
  end

  def test_3
    skip
    algorithm = MediumReverseInteger.new

    assert_equal 21, algorithm.reverse(120)
  end

  def test_4
    skip
    algorithm = MediumReverseInteger.new

    assert_equal 0, algorithm.reverse(2147483648)
  end

  def test_5
    algorithm = MediumReverseInteger.new

    assert_equal 463847412, algorithm.reverse(214748364)
  end
end
