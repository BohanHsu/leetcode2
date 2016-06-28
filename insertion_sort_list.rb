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
def insertion_sort_list(head)
  return head if head.nil? || head.next.nil?

  sorted = head
  head = head.next
  sorted.next = nil

  while !head.nil?
    tmp = head
    head = head.next
    tmp.next = nil

    if tmp.val < sorted.val
      tmp.next = sorted
      sorted = tmp
    else
      n = sorted.next
      prev = sorted

      while !n.nil? && n.val < tmp.val do
        prev = n
        n = n.next
      end
      prev.next = tmp
      tmp.next = n
    end
  end

  return sorted
end
