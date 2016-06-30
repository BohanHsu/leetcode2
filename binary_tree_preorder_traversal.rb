# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
  result = []
  stack = []
  n = root

  while !n.nil? || !stack.empty? do
    n = stack.pop if n.nil?
    result << n.val
    stack << n.right if !n.right.nil?
    n = n.left
  end

  result
end
