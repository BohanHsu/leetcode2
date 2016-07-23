require 'minitest/autorun'
require '../flatten_binary_tree_to_linked_list'

describe 'flatten(root)' do
  it 'should work1' do
    array = [1,2,5,3,4,nil,6]
    expected_result = [1,2,3,4,5,6]
    root = convert_array_to_tree(array)
    flatten(root)
    convert_tree_to_linked_list(root).must_equal(expected_result)

    array = [1,2,5]
    expected_result = [1,2,5]
    root = convert_array_to_tree(array)
    flatten(root)
    convert_tree_to_linked_list(root).must_equal(expected_result)

    array = [1]
    expected_result = [1]
    root = convert_array_to_tree(array)
    flatten(root)
    convert_tree_to_linked_list(root).must_equal(expected_result)

    array = []
    expected_result = []
    root = convert_array_to_tree(array)
    flatten(root)
    convert_tree_to_linked_list(root).must_equal(expected_result)
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

def convert_tree_to_linked_list(root)
  result = []
  n = root
  while !n.nil? do
    result << n.val
    n = n.right
  end
  result
end
