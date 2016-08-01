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
def zigzag_level_order(root)
  return [] if root.nil?
  level = {root => 0}
  arr = []
  queue = [root]

  while !queue.empty? do
    n = queue.shift
    if arr.length == level[n]
      arr << []
    end

    arr[arr.length-1] << n.val

    if !n.left.nil?
      queue << n.left
      level[n.left] = level[n] + 1
    end

    if !n.right.nil?
      queue << n.right
      level[n.right] = level[n] + 1
    end
  end

  arr.each_with_index.map do |row, i|
    if i % 2 == 0
      row
    else
      row.reverse
    end
  end
end
