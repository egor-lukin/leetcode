require 'minitest/autorun'
require_relative './../src/parser'

class ParserTest < Minitest::Test
  def setup
    html_path = '/app/test/fixtures/leetcode.html'
    @html = File.read(html_path)
  end

  def test_1
    parser = Parser.new(@html)
    parser.run

    assert_equal :medium, parser.level
    assert_equal 11, parser.number

    assert_equal 11, parser.class_content

    # assert_equal :max_area, parser.method_name
    # assert_equal [:height], parser.method_params

    # assert_equal 2, parser.tests.size
    # assert_equal [1,8,6,2,5,4,8,3,7], parser.tests[0][:input][:height]
    # assert_equal 49, parser.tests[0][:output]
    # assert_equal [1, 1], parser.tests[1][:input][:height]
    # assert_equal 1, parser.tests[1][:output]
  end

  # def test_parse_input
  #   parser = Parser.new(@html)
  #   parser.run

  #   input = parser.parse_test_input('l1 = [2,4,3], l2 = [5,6,4]')
  #   assert_equal [2, 4, 3], input['l1']
  #   assert_equal [5, 6, 4], input['l2']
  # end
end
