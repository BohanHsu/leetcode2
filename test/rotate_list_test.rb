require 'minitest/autorun'
require '../rotate_list'

describe 'rotate_right(head, k)' do
  it 'should work1' do
    array = [1,2,3,4,5]
    k = 2
    expected_result = [4,5,1,2,3]
    head = convert_array_to_list(array)
    result_head = rotate_right(head, k)
    actual_result = convert_list_to_array(result_head)
    actual_result.must_equal(expected_result)

    array = [1,2,3,4,5]
    k = 7
    expected_result = [4,5,1,2,3]
    head = convert_array_to_list(array)
    result_head = rotate_right(head, k)
    actual_result = convert_list_to_array(result_head)
    actual_result.must_equal(expected_result)

    array = [1,2,3,4,5]
    k = 5
    expected_result = [1,2,3,4,5]
    head = convert_array_to_list(array)
    result_head = rotate_right(head, k)
    actual_result = convert_list_to_array(result_head)
    actual_result.must_equal(expected_result)

    array = [1,2,3,4,5]
    k = 0
    expected_result = [1,2,3,4,5]
    head = convert_array_to_list(array)
    result_head = rotate_right(head, k)
    actual_result = convert_list_to_array(result_head)
    actual_result.must_equal(expected_result)

    array = [1,2,3,4,5]
    k = 1
    expected_result = [5,1,2,3,4]
    head = convert_array_to_list(array)
    result_head = rotate_right(head, k)
    actual_result = convert_list_to_array(result_head)
    actual_result.must_equal(expected_result)

    array = []
    k = 0
    expected_result = []
    head = convert_array_to_list(array)
    result_head = rotate_right(head, k)
    actual_result = convert_list_to_array(result_head)
    actual_result.must_equal(expected_result)
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
