# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  inorder_index = {}
  inorder.each_with_index do |e, i|
    inorder_index[e] = i
  end

  return build_tree_helper(inorder, 0, inorder.length-1, preorder, 0, preorder.length-1, inorder_index)
end

def build_tree_helper(inorder, i_f, i_t, preorder, p_f, p_t, inorder_index)
  if i_f > i_t || p_f > p_t
    return nil
  end

  if i_f == i_t && p_f == p_t
    return TreeNode.new(inorder[i_f])
  end

  pivot = inorder_index[preorder[p_f]]
  left_length = pivot - i_f
  right_length = i_t - pivot

  root = TreeNode.new(preorder[p_f])
  root.left = build_tree_helper(inorder, i_f, pivot-1, preorder, p_f+1, p_f+left_length, inorder_index)
  root.right = build_tree_helper(inorder, pivot+1, i_t, preorder, p_f+left_length+1, p_t, inorder_index)

  return root
end
