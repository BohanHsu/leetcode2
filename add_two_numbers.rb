# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  ni = l1
  nj = l2
  carrier = 0

  fake_head = ListNode.new(nil)
  tail = fake_head

  while !ni.nil? || !nj.nil? do
    a = 0
    b = 0
    if !ni.nil? && !nj.nil?
      a = ni.val
      b = nj.val
      ni = ni.next
      nj = nj.next
    elsif ni.nil? && !nj.nil?
      b = nj.val
      nj = nj.next
    elsif !ni.nil? && nj.nil?
      a = ni.val
      ni = ni.next
    end

    digit = (a + b + carrier) % 10
    carrier = (a + b + carrier) / 10

    tail.next = ListNode.new(digit)
    tail = tail.next
  end

  if carrier > 0
    tail.next = ListNode.new(carrier)
    tail = tail.next
  end

  return fake_head.next
end
