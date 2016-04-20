# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  count = 1
  stack = []
  n = root

  while !n.nil? do
    stack << n
    n = n.left
  end

  while !stack.empty? do
    m = stack.pop
    if count == k
      return m.val
    else
      count += 1
    end

    n = m.right
    while !n.nil? do
      stack << n
      n = n.left
    end
  end
  return count < k
end
