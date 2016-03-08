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
def odd_even_list(head)
  return nil if head.nil?
  fake_head = ListNode.new(nil)
  fake_head.next = head
  prev = fake_head
  ptr = head

  even_head = ListNode.new(nil)
  even_tail = even_head

  index = 1
  while !ptr.nil? do
    if index % 2 == 1
      prev = ptr
      ptr = ptr.next
    else
      even_tail.next = ptr
      prev.next = ptr.next
      ptr.next = nil
      even_tail = even_tail.next
      ptr = prev.next
    end
    index += 1
  end

  prev.next = even_head.next
  return fake_head.next
end
