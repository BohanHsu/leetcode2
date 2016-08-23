# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return nil if head.nil?
  len = 0
  n = head
  tail = nil
  while !n.nil? do
    tail = n
    n = n.next
    len += 1
  end

  n = head
  p = nil
  i = 0

  while i < (len - k) % len do
    p = n
    n = n.next
    i += 1
  end

  if p.nil?
    return head
  end

  p.next = nil
  tail.next = head
  return n
end
