# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root)
  return [] if root.nil?
  results = []

  queue = [[root, "#{root.val}"]]

  while !queue.empty? do
    node, path = queue.shift
    if node.left.nil? && node.right.nil?
      results << path
    else
      if !node.left.nil?
        queue << [node.left, path + "->#{node.left.val}"]
      end
      if !node.right.nil?
        queue << [node.right, path + "->#{node.right.val}"]
      end
    end
  end
  results
end
