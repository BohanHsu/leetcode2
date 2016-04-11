require 'minitest/autorun'
require '../binary_tree_paths'

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

describe 'binary_tree_paths(root)' do
  it 'should work1' do
    array = [1,2,3,nil,5]
    root = convert_array_to_tree(array)
    expected_result = ["1->2->5", "1->3"]
    binary_tree_paths(root).sort.must_equal(expected_result.sort)

    array = []
    root = convert_array_to_tree(array)
    expected_result = []
    binary_tree_paths(root).sort.must_equal(expected_result.sort)
  end
end
