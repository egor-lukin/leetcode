class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def self.to_array(list)
    return [] if list.nil?

    arr = []
    loop do
      arr.push(list.val)
      list = list.next
      if list.next.nil?
        arr.push(list.val)
        break
      end
    end
    arr
  end
end
