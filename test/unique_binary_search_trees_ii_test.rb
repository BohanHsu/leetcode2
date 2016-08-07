require 'minitest/autorun'
require '../unique_binary_search_trees_ii'

describe 'generate_trees(n)' do
  it 'should work1' do
    n = 0
    expected_result = []
    trees = generate_trees(n)
    arrays = trees.map {|rt| convert_tree_to_array(rt)}
    arrays.sort.must_equal(expected_result.sort)

    n = 1
    expected_result = [[1]]
    trees = generate_trees(n)
    arrays = trees.map {|rt| convert_tree_to_array(rt)}
    arrays.sort.must_equal(expected_result.sort)

    n = 2
    expected_result = [[2,1], [1,nil,2]]
    trees = generate_trees(n)
    arrays = trees.map {|rt| convert_tree_to_array(rt)}
    arrays.sort.must_equal(expected_result.sort)

    n = 3
    expected_result = [
      [1,nil,2,nil,nil,nil,3],
      [1,nil,3,nil,nil,2],
      [2,1,3],
      [3,1,nil,nil,2],
      [3,2,nil,1]
    ]
    trees = generate_trees(n)
    arrays = trees.map {|rt| convert_tree_to_array(rt)}
    #arrays.sort.must_equal(expected_result.sort)
    arrays.must_equal(expected_result)
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
