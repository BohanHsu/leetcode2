# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
  cnt = 1
  fake_head = ListNode.new(nil)
  fake_head.next = head
  node = head
  prev = fake_head

  while cnt < m do
    prev = node
    node = node.next
    cnt += 1
  end

  cnt = 0
  while cnt < n - m do
    tmp = node.next
    node.next = tmp.next
    tmp.next = prev.next
    prev.next = tmp
    cnt += 1
  end

  return fake_head.next
end
