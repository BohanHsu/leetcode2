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
def right_side_view(root)
  views = []
  return views if root.nil?
  level = {root => 0}
  queue = [root]

  while !queue.empty? do
    node = queue.shift
    if views.length == level[node]
      views << node.val
    else
      views[level[node]] = node.val
    end

    if !node.left.nil?
      queue << node.left
      level[node.left] = level[node] + 1
    end

    if !node.right.nil?
      queue << node.right
      level[node.right] = level[node] + 1
    end
  end

  views
end
