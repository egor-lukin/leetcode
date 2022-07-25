class Array
  def to_list
    head = nil
    list = nil
    self.each do |item|
      if head.nil?
        head = ListNode.new(item)
        list = head
      else
        list.next = ListNode.new(item)
        list = list.next
      end
    end

    head
  end
end
