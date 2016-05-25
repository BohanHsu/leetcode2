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
def reverse_list(head)
  new_head = nil
  node = head

  while !node.nil? do
    tmp = node.next
    node.next = new_head
    new_head = node
    node = tmp
  end

  new_head
end
