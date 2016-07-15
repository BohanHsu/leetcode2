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
def sum_numbers(root)
  return 0 if root.nil?

  sum = 0
  queue = [root]
  visited = {root => root.val}

  while !queue.empty? do
    n = queue.shift
    if n.left.nil? && n.right.nil?
      sum += visited[n]
    else
      if !n.left.nil?
        queue << n.left
        visited[n.left] = visited[n] * 10 + n.left.val
      end

      if !n.right.nil?
        queue << n.right
        visited[n.right] = visited[n] * 10 + n.right.val
      end
    end
  end

  sum
end
