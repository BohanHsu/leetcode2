# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
  inorder_index = {}
  inorder.each_with_index do |e, i|
    inorder_index[e] = i
  end

  build_tree_helper(inorder, 0, inorder.length-1, postorder, 0, postorder.length-1, inorder_index)
end

# to: inclusive
def build_tree_helper(inorder, f_i, t_i, postorder, f_p, t_p, inorder_index)
  if f_i > t_i || f_p > t_p
    return nil
  end

  if f_i == t_i && f_p == t_p
    return TreeNode.new(inorder[f_i])
  end

  pivot = inorder_index[postorder[t_p]]
  root = TreeNode.new(postorder[t_p])

  left_length = pivot - f_i
  right_lenght = t_i - pivot

  root.right = build_tree_helper(inorder, pivot+1, t_i, postorder, t_p-right_lenght, t_p-1, inorder_index)
  root.left = build_tree_helper(inorder, f_i, pivot-1, postorder, f_p, f_p+left_length-1, inorder_index)

  return root
end
