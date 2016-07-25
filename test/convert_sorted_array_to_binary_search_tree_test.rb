require 'minitest/autorun'
require '../convert_sorted_array_to_binary_search_tree'
require '../balanced_binary_tree'

describe 'sorted_array_to_bst(nums)' do
  it 'should work1' do
    array = [1,2,3,4,5,6,7]
    root = sorted_array_to_bst(array)
    is_balanced(root).must_equal(true)
    in_order_traverse(root, []).must_equal(array)

    array = [1,2]
    root = sorted_array_to_bst(array)
    is_balanced(root).must_equal(true)
    in_order_traverse(root, []).must_equal(array)

    array = [1]
    root = sorted_array_to_bst(array)
    is_balanced(root).must_equal(true)
    in_order_traverse(root, []).must_equal(array)

    array = []
    root = sorted_array_to_bst(array)
    is_balanced(root).must_equal(true)
    in_order_traverse(root, []).must_equal(array)
  end
end

def in_order_traverse(root, arr)
  return arr if root.nil?
  if !root.left.nil?
    in_order_traverse(root.left, arr)
  end

  arr << root.val

  if !root.right.nil?
    in_order_traverse(root.right, arr)
  end
  arr
end
