require 'minitest/autorun'
require_relative './source.rb'

class MediumZigZagConversionTest < Minitest::Test
  def test_1
    algorithm = MediumZigZagConversion.new
    expected = "PAHNAPLSIIGYIR"
    actual = algorithm.convert "PAYPALISHIRING", 3

    assert_equal expected, actual
  end

  def test_2
    algorithm = MediumZigZagConversion.new
    expected = "PINALSIGYAHRPI"
    actual = algorithm.convert "PAYPALISHIRING", 4

    assert_equal expected, actual
  end

  def test_3
    algorithm = MediumZigZagConversion.new
    expected = "AEBDFCG"
    actual = algorithm.convert "ABCDEFG", 3

    assert_equal expected, actual
  end

  def test_4
    algorithm = MediumZigZagConversion.new
    expected = "A"
    actual = algorithm.convert "A", 1

    assert_equal expected, actual
  end

  def test_5
    algorithm = MediumZigZagConversion.new
    expected = "ACEBDF"
    actual = algorithm.convert "ABCDEF", 2

    assert_equal expected, actual
  end
end
