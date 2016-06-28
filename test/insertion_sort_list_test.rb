require 'minitest/autorun'
require '../insertion_sort_list'

describe 'insertion_sort_list(head)' do
  it 'should work1' do
    array = []
    expected_result = array.sort
    convert_list_to_array(insertion_sort_list(convert_array_to_list(array))).must_equal(expected_result)

    array = [1]
    expected_result = array.sort
    convert_list_to_array(insertion_sort_list(convert_array_to_list(array))).must_equal(expected_result)

    array = [1, 1]
    expected_result = array.sort
    convert_list_to_array(insertion_sort_list(convert_array_to_list(array))).must_equal(expected_result)

    array = [0, 1]
    expected_result = array.sort
    convert_list_to_array(insertion_sort_list(convert_array_to_list(array))).must_equal(expected_result)

    array = [1, 0]
    expected_result = array.sort
    convert_list_to_array(insertion_sort_list(convert_array_to_list(array))).must_equal(expected_result)

    array = [1,3,5,6,2,34,54,23,1,2,32,9143]
    expected_result = array.sort
    convert_list_to_array(insertion_sort_list(convert_array_to_list(array))).must_equal(expected_result)
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
