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
def postorder_traversal(root)
  return [] if root.nil?
  result = []
  n = root

  stack = []

  last_visited = nil
  while !n.nil? do
    stack << n
    n = n.left
  end

  while !stack.empty? do
    if !stack.last.right.nil? && stack.last.right != last_visited
      n = stack.last.right
      while !n.nil? do
        stack << n
        n = n.left
      end
    else
      last_visited = stack.pop
      result << last_visited.val
    end
  end
  result
end
