require 'minitest/autorun'
require '../lowest_common_ancestor_of_a_binary_search_tree'

describe 'lowest_common_ancestor(root, p, q)' do
  it 'should work1' do
    array = [6,2,8,0,4,7,9,nil,nil,3,5]
    root = convert_array_to_tree(array)
    p = root.left
    q = root.right
    lowest_common_ancestor(root, p, q).must_equal(root)

    p = root.left.left
    q = root.left.right
    lowest_common_ancestor(root, p, q).must_equal(root.left)

    p = root.left.left
    q = root.left
    lowest_common_ancestor(root, p, q).must_equal(root.left)
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
