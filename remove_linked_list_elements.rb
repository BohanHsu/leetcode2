# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  while !head.nil? && head.val == val do
    head = head.next
  end

  return head if head.nil?

  n = head
  while !n.nil? do
    p = n
    n = n.next
    #puts "n.val=#{n.val}, p.val=#{p.val}"

    while !n.nil? && n.val == val do
      p.next = n.next
      n = p.next
      #puts "  n.val=#{n.val}, p.val=#{p.val}"
    end
  end

  head
end
