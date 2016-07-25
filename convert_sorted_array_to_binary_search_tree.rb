# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  return sorted_array_to_bst_helper(nums, 0, nums.length)
end

def sorted_array_to_bst_helper(nums, from, to)
  return nil if from == to

  if from == to - 1
    return TreeNode.new(nums[from])
  end

  if from == to - 2
    root = TreeNode.new(nums[from])
    root.right = TreeNode.new(nums[from+1])
    return root
  end

  middle = (from + to) / 2
  root = TreeNode.new(nums[middle])
  root.left = sorted_array_to_bst_helper(nums, from, middle)
  root.right = sorted_array_to_bst_helper(nums, middle+1, to)
  return root
end
