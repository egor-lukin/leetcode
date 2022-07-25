require 'minitest/autorun'
require 'byebug'
require_relative '../src/zig_zag_convertion.rb'

class ZigZagConvertionTest < Minitest::Test
  def test_1
    algorithm = ZigZagConvertion.new
    expected = "PAHNAPLSIIGYIR"
    actual = algorithm.convert "PAYPALISHIRING", 3

    assert_equal expected, actual
  end

  def test_2
    algorithm = ZigZagConvertion.new
    expected = "PINALSIGYAHRPI"
    actual = algorithm.convert "PAYPALISHIRING", 4

    assert_equal expected, actual
  end

  def test_3
    algorithm = ZigZagConvertion.new
    expected = "AEBDFCG"
    actual = algorithm.convert "ABCDEFG", 3

    assert_equal expected, actual
  end

  def test_4
    algorithm = ZigZagConvertion.new
    expected = "A"
    actual = algorithm.convert "A", 1

    assert_equal expected, actual
  end

  def test_5
    algorithm = ZigZagConvertion.new
    expected = "ACEBDF"
    actual = algorithm.convert "ABCDEF", 2

    assert_equal expected, actual
  end
end
