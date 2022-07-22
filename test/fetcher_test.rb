require 'minitest/autorun'
require_relative './../src/fetcher'

class FetcherTest < Minitest::Test
  def test_1
    Fetcher.call("test")

    assert_equal 1, 2
  end
end
