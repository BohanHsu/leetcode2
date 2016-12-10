# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  head = ListNode.new(nil)
  tail = head

  while !l1.nil? || !l2.nil? do
    if l1.nil?
      tail.next = l2
      tail = l2
      l2 = l2.next
    elsif l2.nil?
      tail.next = l1
      tail = l1
      l1 = l1.next
    elsif !l1.nil? && !l2.nil?
      if l1.val < l2.val
        tail.next = l1
        tail = l1
        l1 = l1.next
      else
        tail.next = l2
        tail = l2
        l2 = l2.next
      end
    end
  end
  tail.next = nil
  return head.next
end
