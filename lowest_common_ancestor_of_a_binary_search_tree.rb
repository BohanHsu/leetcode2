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
  n = root
  a = p.val < q.val ? p : q
  b = p.val < q.val ? q : p

  while !(a.val <= n.val && n.val <= b.val) do
    if b.val < n.val
      n = n.left
    end

    if a.val > n.val
      n = n.right
    end
  end

  n
end
