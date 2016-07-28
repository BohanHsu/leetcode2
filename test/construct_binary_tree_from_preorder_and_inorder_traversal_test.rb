require 'minitest/autorun'
require '../construct_binary_tree_from_preorder_and_inorder_traversal'

describe 'build_tree(preorder, inorder)' do
  it 'should work1' do
    inorder = [4,2,6,5,7,1,3]
    preorder = [1,2,4,5,6,7,3]
    expected_result = [1,2,3,4,5,nil,nil,nil,nil,6,7]
    root = build_tree(preorder, inorder)
    actual_result = convert_tree_to_array(root)
    actual_result.must_equal(expected_result)

    inorder = [2,1]
    preorder = [1,2]
    expected_result = [1,2]
    root = build_tree(preorder, inorder)
    actual_result = convert_tree_to_array(root)
    actual_result.must_equal(expected_result)

    inorder = [1,2]
    preorder = [1,2]
    expected_result = [1,nil,2]
    root = build_tree(preorder, inorder)
    actual_result = convert_tree_to_array(root)
    actual_result.must_equal(expected_result)

    inorder = [1,2]
    preorder = [2,1]
    expected_result = [2,1]
    root = build_tree(preorder, inorder)
    actual_result = convert_tree_to_array(root)
    actual_result.must_equal(expected_result)

    inorder = [2,1]
    preorder = [2,1]
    expected_result = [2,nil,1]
    root = build_tree(preorder, inorder)
    actual_result = convert_tree_to_array(root)
    actual_result.must_equal(expected_result)

    inorder = [1]
    preorder = [1]
    expected_result = [1]
    root = build_tree(preorder, inorder)
    actual_result = convert_tree_to_array(root)
    actual_result.must_equal(expected_result)

    inorder = []
    preorder = []
    expected_result = []
    root = build_tree(preorder, inorder)
    actual_result = convert_tree_to_array(root)
    actual_result.must_equal(expected_result)
  end
end

def convert_array_to_tree(array)
  return nil if array.empty?
  array = array.map do |val|
    if !val.nil?
      TreeNode.new(val)
    else
      nil
    end
  end

  array.length.times do |i|
    if !array[i].nil?
      if !array[(i + 1) * 2 - 1].nil?
        array[i].left = array[(i + 1) * 2 - 1]
      end
      if !array[(i + 1) * 2].nil?
        array[i].right = array[(i + 1) * 2]
      end
    end
  end

  return array[0]
end

def convert_tree_to_array(root)
  return [] if root.nil?
  node_to_idx = {root => 1}
  idx_to_val = {}
  queue = [root]
  max_idx = 1

  while !queue.empty? do
    n = queue.shift
    idx = node_to_idx[n]
    idx_to_val[idx] = n.val

    max_idx = [max_idx, idx].max

    if !n.left.nil?
      queue << n.left
      node_to_idx[n.left] = idx * 2
    end

    if !n.right.nil?
      queue << n.right
      node_to_idx[n.right] = idx * 2 + 1
    end
  end

  array = max_idx.times.map {nil}
  idx_to_val.each do |k, v|
    array[k-1] = v
  end

  return array
end
