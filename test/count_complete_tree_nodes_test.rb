require 'minitest/autorun'
require '../count_complete_tree_nodes'

describe 'get_ith_node_in_last_row(root, i, max_depth)' do
  it 'should work1' do
    array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
    root = convert_array_to_tree(array)
    max_depth = 4
    (0...7).each do |i|
      get_ith_node_in_last_row(root, i, max_depth).val.must_equal(i + 8)
    end
    i = 7
    get_ith_node_in_last_row(root, i, max_depth).must_equal(nil)
  end

  it 'should work4' do
    array = [1,2]
    root = convert_array_to_tree(array)
    max_depth = 2
    get_ith_node_in_last_row(root, 0, max_depth).val.must_equal(2)
    get_ith_node_in_last_row(root, 1, max_depth).must_equal(nil)
  end
end

describe 'count_nodes(root)' do
  it 'should work2' do
    100.times do |len|
      array = len.times.map do |i|
        i
      end
      root = convert_array_to_tree(array)
      count_nodes(root).must_equal(len)
    end
  end

  it 'should work3' do
    len = 2
    array = len.times.map do |i|
      i
    end
    root = convert_array_to_tree(array)
    count_nodes(root).must_equal(len)
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
