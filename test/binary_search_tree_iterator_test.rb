require 'minitest/autorun'
require '../binary_search_tree_iterator'

describe 'BSTIterator' do
  it 'should work1' do
    tree_array = [10, 5 ,15, 2, 6, 12, nil, 1, 3, nil, 8, nil, 13]
    root = convert_array_to_tree(tree_array)
    iter = BSTIterator.new(root)

    list = []
    expected_result = expected_result_from_array(tree_array)
    while list.length < expected_result.length do
      iter.has_next.must_equal(true)
      list << iter.next
    end
    iter.has_next.must_equal(false)
    list.must_equal(expected_result)
  end

  it 'should work2' do
    tree_array = []
    root = convert_array_to_tree(tree_array)
    iter = BSTIterator.new(root)

    list = []
    expected_result = expected_result_from_array(tree_array)
    while list.length < expected_result.length do
      iter.has_next.must_equal(true)
      list << iter.next
    end
    iter.has_next.must_equal(false)
    list.must_equal(expected_result)
  end
end

def expected_result_from_array(tree_array)
  tree_array.select { |ele| !ele.nil? }.sort
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
