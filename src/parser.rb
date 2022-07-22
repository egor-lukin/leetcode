require 'ferrum'
require 'byebug'
require 'nokogiri'

class Parser
  TEST_PATTERN = /<strong>Input:<\/strong>\s+([^<]*)<strong>Output:<\/strong>\s+([^<]*)/

  attr_reader :name, :level, :number, :tests, :class_content

  def initialize html
    @content = Nokogiri::HTML(html)
  end

  def run
    @level ||= extract_level
    @number ||= extract_number
    @tests ||= extract_tests
    @class_content ||= extract_class_content
  end

  private

  def extract_level
    elements = @content.xpath "//div[@diff]"
    return if elements.empty?

    elements[0].attr('diff').to_sym
  end

  def extract_number
    elements = @content.xpath "//div[@data-cy=\"question-title\"]"

    elements[0].attr('data-cy')
    elements[0]
      .inner_html
      .split('.')
      .first
      .to_i
  end

  def extract_tests
    elements = @content.xpath "//pre"
    elements_with_tests = find_elements_with_tests(elements)
    tests = elements_with_tests.map { |el| extract_test el }
    tests
  end

  def find_elements_with_tests elements
    elements.select do |el|
      el.inner_html.match(TEST_PATTERN)
    end
  end

  def extract_test element
    raw_input, raw_output = element.inner_html.match(TEST_PATTERN).captures
    # input = parse_test_input raw_input

    { input: raw_input, output: raw_output }
  end

  # def parse_test_input input
  #   params = {}
  #   token = ''
  #   is_var_name = true
  #   is_var_value = false
  #   is_array = false
  #   (0..(input.size - 1)).each do |i|
  #     if is_var_name == true && input[i].match(/[a-z0-9_]/)
  #       token += input[i]
  #       next
  #     end

  #     if input[i] == '='
  #     end

  #     if input[i] == '['
  #     end

  #     if input[i] == ']'
  #     end

  #     if input[i]
  #       token += input[i]
  #     end
  #   end
  # end

  def extract_class_content
    elements = @content.xpath "//div[@class=\"CodeMirror-code\"]"
    element = elements[0]
    element.text
  end

  def method_name
    'max_area'
  end

  def method_params
    ['height']
  end
end
