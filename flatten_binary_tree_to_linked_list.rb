# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
  return if root.nil?
  flatten_helper(root)
end

def flatten_helper(node)
  if node.left.nil? && node.right.nil?
    return [node, node]
  elsif node.left.nil? && !node.right.nil?
    r_head, r_tail = flatten_helper(node.right)
    node.left = nil
    node.right = r_head
    return [node, r_tail]
  elsif !node.left.nil? && node.right.nil?
    l_head, l_tail = flatten_helper(node.left)
    node.left = nil
    node.right = l_head
    return [node, l_tail]
  else
    l_head, l_tail = flatten_helper(node.left)
    r_head, r_tail = flatten_helper(node.right)
    node.left = nil
    node.right = l_head
    l_tail.left = nil
    l_tail.right = r_head
    return [node, r_tail]
  end
end
