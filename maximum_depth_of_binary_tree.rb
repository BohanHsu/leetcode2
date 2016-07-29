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
def max_depth(root)
  return 0 if root.nil?

  depth = {root => 1}
  queue = [root]

  max_depth = -1

  while !queue.empty? do
    n = queue.shift
    max_depth = [max_depth, depth[n]].max
    if !n.left.nil?
      queue << n.left
      depth[n.left] = depth[n] + 1
    end

    if !n.right.nil?
      queue << n.right
      depth[n.right] = depth[n] + 1
    end
  end

  max_depth
end
