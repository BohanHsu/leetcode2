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
  n = head
  while !n.nil? do
    m = n
    while !m.next.nil? && m.next.val == m.val do
      m = m.next
    end

    n.next = m.next
    n = n.next
  end

  return head
end
