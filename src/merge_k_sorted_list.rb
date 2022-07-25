require 'byebug'
require_relative './list_node'

class MergeKSortedList
  # @param {ListNode[]} lists
  # @return {ListNode}
  def merge_k_lists(lists)
    k = lists.size

    head = nil
    node = nil

    # O(n*m)
    loop do
      min_node = nil
      min_index = nil
      (0..(k-1)).each do |i|
        current_node = lists[i]
        next if current_node.nil?

        if min_node.nil? || current_node.val < min_node.val
           min_node = current_node
           min_index = i
        end
      end

      break if min_node.nil?

      if head.nil?
        head = min_node
      else
        node.next = min_node
      end

      node = min_node
      lists[min_index] = min_node.next
    end

    head
  end
end
