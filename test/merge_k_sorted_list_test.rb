require 'minitest/autorun'
require 'byebug'
require 'benchmark'
require_relative '../src/merge_k_sorted_list'
require_relative '../src/list_node'
require_relative '../src/array'

class MergeKSortedListTest < Minitest::Test
  def test_1
    algorithm = MergeKSortedList.new
    expected = [1,1,2,3,4,4,5,6]
    head = algorithm.merge_k_lists [[1,4,5].to_list, [1,3,4].to_list, [2,6].to_list]

    assert_equal expected, ListNode.to_array(head)
  end

  def test_2
    algorithm = MergeKSortedList.new
    expected = []
    head = algorithm.merge_k_lists []

    assert_equal expected, ListNode.to_array(head)
  end

  def test_3
    algorithm = MergeKSortedList.new
    expected = []
    head = algorithm.merge_k_lists [[].to_list]

    assert_equal expected, ListNode.to_array(head)
  end

  def test_4
    arr = eval File.read(File.expand_path "testcase", "test/fixtures/merge_k_sorted_list_test")
    lists = arr.map { |i| i.to_list }

    algorithm = MergeKSortedList.new
    bm = Benchmark.measure { algorithm.merge_k_lists lists }
    assert bm.total < 14
  end
end
