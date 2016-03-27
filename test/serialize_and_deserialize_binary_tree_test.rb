require 'minitest/autorun'
require '../serialize_and_deserialize_binary_tree'

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

describe 'convert_tree_to_array(root)' do
  it 'should work' do
    root = TreeNode.new(0)
    n1 = TreeNode.new(1)
    n2 = TreeNode.new(2)
    n3 = TreeNode.new(3)
    root.left = n1
    root.right = n2
    n2.right = n3
    expected_result = [0,1,2,nil,nil,nil,3]
    convert_tree_to_array(root).must_equal(expected_result)

    root = nil
    expected_result = []
    convert_tree_to_array(root).must_equal(expected_result)
  end
end

describe 'convert_array_to_tree(array)' do
  it 'should work' do
    array = [0,1,2,nil,nil,nil,3]
    actual_result = convert_tree_to_array(convert_array_to_tree(array))
    actual_result.must_equal(array)

    array = []
    actual_result = convert_tree_to_array(convert_array_to_tree(array))
    actual_result.must_equal(array)
  end
end

describe 'serialize & deserialize' do
  it 'should work1' do
    array = []
    actual_result = convert_tree_to_array(deserialize(serialize(convert_array_to_tree(array))))
    actual_result.must_equal(array)

    array = [0,1,2,nil,nil,nil,3]
    actual_result = convert_tree_to_array(deserialize(serialize(convert_array_to_tree(array))))
    actual_result.must_equal(array)
  end
end
