require 'minitest/autorun'
require '../binary_tree_maximum_path_sum'

describe 'max_path_sum(root)' do
  it 'should work1' do
    array = [1,2,3]
    root = convert_array_to_tree(array)
    expected_result = 6
    max_path_sum(root).must_equal(expected_result)

    array = [1,2,5,3,4]
    root = convert_array_to_tree(array)
    expected_result = 12
    max_path_sum(root).must_equal(expected_result)

    array = [-1,-2,-5,-3,-4]
    root = convert_array_to_tree(array)
    expected_result = -1
    max_path_sum(root).must_equal(expected_result)

    array = [-2, nil, -3]
    root = convert_array_to_tree(array)
    expected_result = -2
    max_path_sum(root).must_equal(expected_result)

    array = [0]
    root = convert_array_to_tree(array)
    expected_result = 0
    max_path_sum(root).must_equal(expected_result)

    array = [2, -1]
    root = convert_array_to_tree(array)
    expected_result = 2
    max_path_sum(root).must_equal(expected_result)

    array = [-2, 1]
    root = convert_array_to_tree(array)
    expected_result = 1
    max_path_sum(root).must_equal(expected_result)
  end

  it 'should work2' do
    array = [-1,5,nil,4,] + [nil] * 4 + [2] + [nil] * 8 + [-4]
    root = convert_array_to_tree(array)
    expected_result = 11
    max_path_sum(root).must_equal(expected_result)
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
    if !array[(i + 1) * 2 - 1].nil?
      array[i].left = array[(i + 1) * 2 - 1]
    end
    if !array[(i + 1) * 2].nil?
      array[i].right = array[(i + 1) * 2]
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
