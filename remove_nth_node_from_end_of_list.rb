# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  len = 0
  node = head
  while !node.nil? do
    len += 1
    node = node.next
  end
  target = len - n

  if target == 0
    return head.next
  end

  node = head
  prev = nil
  index = 0

  while index < target do
    prev = node
    node = prev.next

    index += 1
  end

  prev.next = node.next

  return head
end
