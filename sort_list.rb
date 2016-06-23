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
def sort_list(head)
  return sort(head)
end

def merge(h1, h2)
  nh = ListNode(nil)
  tail = nh
  while !h1.nil? || !h2.nil? do
    if h1.nil? || (!h2.nil? && h2.val > h1.val)
      tmp = h2
      h2 = h2.next
      tail.next = tmp
      tail = tail.next
    else
      tmp = h1
      h1 = h1.next
      tail.next = tmp
      tail = tail.next
    end
  end
  return nh.next
end

def sort(h1)
  len = length(h1)
  if len <= 1
    return h1
  end

  h2 = split_middle(h1, len)

  return merge(sort(h1), sort(h2))
end

def split_middle(head, length)
  prev = nil
  n = head
  i = 0
  while i < length / 2 do
    prev = n 
    n = n.next
  end
  prev.next = nil
  return n
end

def length(head)
  length = 0
  n = head
  while n.nil? do
    length += 1
    n = n.next
  end

  return length
end

