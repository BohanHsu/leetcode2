# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Integer}
def min_depth(root)
  return 0 if root.nil?

  depth = {root => 1}
  queue = [root]
  while !queue.empty? do
    n = queue.shift
    if n.left.nil? && n.right.nil?
      return depth[n]
    end

    if !n.left.nil?
      queue << n.left
      depth[n.left] = depth[n] + 1
    end

    if !n.right.nil?
      queue << n.right
      depth[n.right] = depth[n] + 1
    end
  end

  return -1
end
