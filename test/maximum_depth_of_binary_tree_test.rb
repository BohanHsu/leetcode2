require 'minitest/autorun'
require '../maximum_depth_of_binary_tree'

describe 'max_depth(root)' do
  it 'should work1' do
    array = []
    root = convert_array_to_tree(array)
    expected_result = 0
    max_depth(root).must_equal(expected_result)

    array = [1]
    root = convert_array_to_tree(array)
    expected_result = 1
    max_depth(root).must_equal(expected_result)

    array = [1,2]
    root = convert_array_to_tree(array)
    expected_result = 2
    max_depth(root).must_equal(expected_result)

    array = [1,2, nil, 3]
    root = convert_array_to_tree(array)
    expected_result = 3
    max_depth(root).must_equal(expected_result)
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
