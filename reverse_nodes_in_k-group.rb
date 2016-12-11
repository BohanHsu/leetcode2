# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  return head if k == 1
  new_head = ListNode.new(nil)
  new_head.next = head

  prev_tail = new_head
  next_head, idx = find_next_head(prev_tail.next, k)
  while idx == k do
    tmp_head = ListNode.new(nil)
    tmp_tail = nil
    n = prev_tail.next
    k.times do
      m = n.next
      n.next = tmp_head.next
      tmp_head.next = n
      if tmp_tail.nil?
        tmp_tail = n
      end

      n = m
    end

    prev_tail.next = tmp_head.next
    tmp_tail.next = next_head

    prev_tail = tmp_tail
    next_head, idx = find_next_head(prev_tail.next, k)
  end

  return new_head.next
end

def find_next_head(cur_head, k)
  idx = 0
  node = cur_head
  while idx < k && !node.nil? do
    node = node.next
    idx += 1
  end

  return [node, idx]
end
