# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root)
  return [] if root.nil?

  level = {root => 0}
  result = []
  queue = [root]

  while !queue.empty? do
    n = queue.shift
    if result.length <= level[n]
      result << []
    end
    result[result.length-1] << n.val

    if !n.left.nil?
      queue << n.left
      level[n.left] = level[n] + 1
    end

    if !n.right.nil?
      queue << n.right
      level[n.right] = level[n] + 1
    end
  end
  return result.reverse
end
