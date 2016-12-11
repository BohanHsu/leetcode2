# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  new_head = ListNode.new(nil)
  new_head.next = head

  n = new_head
  while !n.next.nil? && !n.next.next.nil? do
    next_head = n.next.next.next
    a = n.next
    b = n.next.next
    n.next = b
    b.next = a
    a.next = next_head
    n = a
  end

  return new_head.next
end
