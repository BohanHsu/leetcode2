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
def inorder_traversal(root)
  result = []
  stack = []
  m = root
  while !m.nil? do
    stack << m
    m = m.left
  end

  while !stack.empty? do
    n = stack.pop
    result << n.val
    m = n.right
    while !m.nil? do
      stack << m
      m = m.left
    end
  end

  result
end
