# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
  return nil if head.nil?
  len = length_of(head)
  case
  when len == 0
    return nil
  when len == 1
    return TreeNode.new(head.val)
  when len == 2
    root = TreeNode.new(head.val)
    root.right = TreeNode.new(head.next.val)
    return root
  else
    ln = head
    prev = nil
    count = 0
    while count < len / 2 do
      prev = ln
      ln = ln.next
      count += 1
    end

    prev.next = nil
    root = TreeNode.new(ln.val)
    root.left = sorted_list_to_bst(head)
    root.right = sorted_list_to_bst(ln.next)
  end
  return root
end

def length_of(head)
  ln = head
  count = 0
  while !ln.nil? do
    count += 1
    ln = ln.next
  end
  return count
end
