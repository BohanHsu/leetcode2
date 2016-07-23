# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Boolean}
def has_path_sum(root, sum)
  if root.nil?
    return false
  end

  queue = [root]
  sums = {root => root.val}

  while !queue.empty? do
    n = queue.shift
    if sums[n] == sum && n.left.nil? && n.right.nil?
      return true
    end
    if !n.left.nil?
      cur_sum = sums[n] + n.left.val
      queue << n.left
      sums[n.left] = cur_sum
    end

    if !n.right.nil?
      cur_sum = sums[n] + n.right.val
      queue << n.right
      sums[n.right] = cur_sum
    end
  end
  false
end
