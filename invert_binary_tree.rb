# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
      @val = val
      @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
  return root if root.nil?
  queue = [root]
  while !queue.empty? do
    n = queue.shift
    tmp = n.right
    n.right = n.left
    n.left = tmp
    if !n.left.nil?
      queue << n.left
    end
    if !n.right.nil?
      queue << n.right
    end
  end
  root
end
