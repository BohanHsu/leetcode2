require 'minitest/autorun'
require '../add_two_numbers'

describe 'add_two_numbers(l1, l2)' do
  it 'should work1' do
    arr1 = [2,4,3]
    arr2 = [5,6,4]
    expected_result = [7,0,8]
    l1 = convert_array_to_list(arr1)
    l2 = convert_array_to_list(arr2)
    convert_list_to_array(add_two_numbers(l1, l2)).must_equal(expected_result)

    arr1 = [2,4,3,5]
    arr2 = [5,6,4]
    expected_result = [7,0,8,5]
    l1 = convert_array_to_list(arr1)
    l2 = convert_array_to_list(arr2)
    convert_list_to_array(add_two_numbers(l1, l2)).must_equal(expected_result)

    arr1 = [9,9,9,9,9]
    arr2 = [1]
    expected_result = [0,0,0,0,0,1]
    l1 = convert_array_to_list(arr1)
    l2 = convert_array_to_list(arr2)
    convert_list_to_array(add_two_numbers(l1, l2)).must_equal(expected_result)
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
