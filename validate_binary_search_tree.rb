# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  return true if root.nil?
  return is_valid_bst_helper(root, -Float::INFINITY, Float::INFINITY)
end

def is_valid_bst_helper(n, low, high)
  if !n.left.nil? && n.left.val >= n.val
    return false
  end

  if !n.right.nil? && n.right.val <= n.val
    return false
  end

  if n.val <= low || n.val >= high
    return false
  end

  return true && 
    (n.left.nil? || is_valid_bst_helper(n.left, low, n.val)) && 
    (n.right.nil? || is_valid_bst_helper(n.right, n.val, high))
end
