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
def delete_duplicates(head)
  fake_head = ListNode.new(nil)
  fake_head.next = head
  n = head
  prev = fake_head
  while !n.nil? do
    m = n
    while !m.next.nil? && m.next.val == m.val do
      m = m.next
    end

    if m != n
      prev.next = m.next
      n = prev.next
    else
      prev = n
      n = n.next
    end
  end

  return fake_head.next
end
