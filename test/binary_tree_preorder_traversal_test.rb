require 'minitest/autorun'
require '../binary_tree_preorder_traversal'

describe 'preorder_traversal(root)' do
  it 'should work1' do
    #               1
    #              / \
    #             2   3
    #            / \  /\
    #           4  n  7  8
    #         /\  /\  /\ /\
    #         n 5 n n n n n n
    #       /\ /
    #      n n 6

    array = [1,2,3,4,nil,7,8,nil,5,nil,nil,nil,nil,nil,nil,nil,nil, 6]
    root = convert_array_to_tree(array)
    expected_result = [1, 2, 4, 5, 6, 3, 7, 8]
    preorder_traversal(root).must_equal(expected_result)

    array = []
    root = convert_array_to_tree(array)
    expected_result = []
    preorder_traversal(root).must_equal(expected_result)

    array = [1]
    root = convert_array_to_tree(array)
    expected_result = [1]
    preorder_traversal(root).must_equal(expected_result)

    array = [1,2,3]
    root = convert_array_to_tree(array)
    expected_result = [1,2,3]
    preorder_traversal(root).must_equal(expected_result)
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
      array[i].left = array[(i + 1) * 2 - 1] if !array[i].nil?
    end
    if !array[(i + 1) * 2].nil?
      array[i].right = array[(i + 1) * 2] if !array[i].nil?
    end
  end

  return array[0]
end
