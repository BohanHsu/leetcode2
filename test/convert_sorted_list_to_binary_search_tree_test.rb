require 'minitest/autorun'
require '../convert_sorted_list_to_binary_search_tree'
require '../balanced_binary_tree'

describe 'sorted_list_to_bst(head)' do
  it 'should work1' do
    array = [1,2,3,4,5,6,7,8,9]
    head = convert_array_to_list(array)
    root = sorted_list_to_bst(head)
    is_balanced(root).must_equal(true)
    in_order_traverse(root, []).must_equal(array.select {|ele| !ele.nil?}.sort)

    array = [1]
    head = convert_array_to_list(array)
    root = sorted_list_to_bst(head)
    is_balanced(root).must_equal(true)
    in_order_traverse(root, []).must_equal(array.select {|ele| !ele.nil?}.sort)

    array = []
    head = convert_array_to_list(array)
    root = sorted_list_to_bst(head)
    is_balanced(root).must_equal(true)
    in_order_traverse(root, []).must_equal(array.select {|ele| !ele.nil?}.sort)
  end
end

def convert_array_to_list(arr)
  fake_head = ListNode.new(nil)
  tail = fake_head
  arr.each do |val|
    tail.next = ListNode.new(val)
    tail = tail.next
  end
  fake_head.next
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
