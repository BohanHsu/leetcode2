# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  parent = {root => nil}
  level = {root => 0}
  queue = [root]

  while !(parent.has_key?(p) && parent.has_key?(q)) do
    n = queue.shift
    if !n.left.nil?
      queue << n.left
      parent[n.left] = n
      level[n.left] = level[n] + 1
    end

    if !n.right.nil?
      queue << n.right
      parent[n.right] = n
      level[n.right] = level[n] + 1
    end
  end

  if level[p] >= level[q]
    a = p
    b = q
  else
    a = q
    b = p
  end

  while level[a] > level[b] do
    a = parent[a]
  end

  while a != b do
    a = parent[a]
    b = parent[b]
  end

  return a
end
