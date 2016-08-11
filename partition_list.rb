# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  lt_head = ListNode.new(nil)
  lt_tail = lt_head
  egt_head = ListNode.new(nil)
  egt_tail = egt_head
  
  n = head
  while !n.nil? do
    if n.val < x
      lt_tail.next = n
      lt_tail = n
    else
      egt_tail.next = n
      egt_tail = n
    end
    p = n
    n = n.next
    p.next = nil
  end

  if lt_head.next.nil?
    return egt_head.next
  end

  lt_tail.next = egt_head.next
  return lt_head.next
end
