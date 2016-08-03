require 'minitest/autorun'
require '../symmetric_tree'

describe 'is_symmetric(root)' do
  it 'should work1' do
    array = [1,2,2,3,nil,nil,3,nil,4] + [nil] * 4 + [4]
    expected_result = true
    root = convert_array_to_tree(array)
    is_symmetric(root).must_equal(expected_result)

    array = [1,2,2]
    expected_result = true
    root = convert_array_to_tree(array)
    is_symmetric(root).must_equal(expected_result)

    array = [1]
    expected_result = true
    root = convert_array_to_tree(array)
    is_symmetric(root).must_equal(expected_result)

    array = []
    expected_result = true
    root = convert_array_to_tree(array)
    is_symmetric(root).must_equal(expected_result)

    array = [1,2,2,3,nil,nil,3,nil,5] + [nil] * 4 + [4]
    expected_result = false
    root = convert_array_to_tree(array)
    is_symmetric(root).must_equal(expected_result)

    array = [1,2,2,3,nil,nil,3,nil,5] + [nil] * 4 + [4] + [nil] * 3 + [5]
    expected_result = false
    root = convert_array_to_tree(array)
    is_symmetric(root).must_equal(expected_result)

    array = [1,2,2,3,nil,nil,3,nil,5] + [nil] * 4 + [4] + [nil] * 13 + [5]
    expected_result = false
    root = convert_array_to_tree(array)
    is_symmetric(root).must_equal(expected_result)

    array = [1,nil,2]
    expected_result = false
    root = convert_array_to_tree(array)
    is_symmetric(root).must_equal(expected_result)

    array = [1,2,nil]
    expected_result = false
    root = convert_array_to_tree(array)
    is_symmetric(root).must_equal(expected_result)
  end
end

#                           1
#                  /                   \
#                  2                   2
#          /            \         /          \
#          3            n        n           3
#      /      \       /   \     /  \        /  \
#      n       4     n    n     n   n      4    n
#      /\      /\    /\   /\    /\  /\     /\     /\
#    n   n     x x  n  n  n n   n n n n    x x    n n

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
