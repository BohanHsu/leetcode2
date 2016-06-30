#Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  return head if head.nil?
  len = 0
  n = head
  while !n.nil? do
    len += 1
    n = n.next
  end
  new_head_idx = (len + 1) / 2

  idx = 0
  n = head
  while idx != new_head_idx - 1 do
    n = n.next
    idx += 1
  end

  new_head = n.next
  n.next = nil

  new_head_reverse = ListNode.new(nil)
  n = new_head
  while !n.nil? do
    tmp = new_head_reverse.next
    new_head_reverse.next = n
    n = n.next
    new_head_reverse.next.next = tmp
  end

  new_head_reverse = new_head_reverse.next
  prev = head
  n = head.next
  m = new_head_reverse
  while !m.nil? do
    prev.next = m
    m = m.next
    prev.next.next = n
    if !m.nil?
      prev = n
      n = prev.next
    end
  end
  return head
end

def length_of_linked_list(head)
  len = 0
  n = head
  while !n.nil? do
    len += 1
    n = n.next
  end
  return len
end
