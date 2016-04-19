# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  len = 0
  n = head
  while !n.nil? do
    n = n.next
    len += 1
  end

  return true if len <= 1

  middle_index = (len - 1) / 2

  #puts "middle_index=#{middle_index}"

  i = 0
  n = head
  p = nil
  while i <= middle_index do
    i += 1
    p = n
    n = n.next
  end

  if !p.nil?
    p.next = nil
  end

  #puts "p.val=#{p.val}, n.val=#{n.val}"

  head2 = n
  n = n.next
  head2.next = nil

  while !n.nil? do
    ne = n.next
    n.next = head2
    head2 = n
    n = ne
  end

  q = head2
  p = head

  result = true
  while !q.nil? do
    #puts "p.val=#{p.val}, q.val=#{q.val}"
    if p.val != q.val
      result = false
      break
    end
    q = q.next
    p = p.next
  end 

  #puts "#{result}"

  n = head2.next
  head2.next = nil
  while !n.nil? do
    ne = n.next
    n.next = head2
    head2 = n
    n = ne
    #puts "n=#{n}, val=#{n.val}"
  end

  #puts "haha"


  n = head
  while !n.next.nil? do
    n = n.next
  end
  n.next = head2
  #puts "n.val=#{n.val}"

  while !n.nil? do
    #puts "--n.val=#{n.val}"
    n = n.next
  end

  result
end
