require 'minitest/autorun'
require '../merge_two_sorted_lists'

describe 'merge_two_lists(l1, l2)' do
  it 'should work1' do
    arr1 = [1,3,5,7,8]
    arr2 = [2,4,6,9,10]
    l1 = convert_array_to_list(arr1)
    l2 = convert_array_to_list(arr2)
    l3 = merge_two_lists(l1, l2)
    actual_arr = convert_list_to_array(l3)
    actual_arr.must_equal((arr1+arr2).sort)

    arr1 = [1,3,5,7,8]
    arr2 = []
    l1 = convert_array_to_list(arr1)
    l2 = convert_array_to_list(arr2)
    l3 = merge_two_lists(l1, l2)
    actual_arr = convert_list_to_array(l3)
    actual_arr.must_equal((arr1+arr2).sort)

    arr1 = []
    arr2 = [2,4,6,9,10]
    l1 = convert_array_to_list(arr1)
    l2 = convert_array_to_list(arr2)
    l3 = merge_two_lists(l1, l2)
    actual_arr = convert_list_to_array(l3)
    actual_arr.must_equal((arr1+arr2).sort)
  end
end

def convert_list_to_array(head)
  arr = []
  while !head.nil? do
    arr << head.val
    head = head.next
  end
  arr
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
