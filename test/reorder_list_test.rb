require 'minitest/autorun'
require '../reorder_list'

describe 'reorder_list(head)' do
  it 'should work1' do
    array = [1,2,3,4]
    head = convert_array_to_list(array)
    actual_result = convert_list_to_array(reorder_list(head))
    expected_result = [1,4,2,3]
    actual_result.must_equal(expected_result)

    array = [1,2,3,4,5]
    head = convert_array_to_list(array)
    actual_result = convert_list_to_array(reorder_list(head))
    expected_result = [1,5,2,4,3]
    actual_result.must_equal(expected_result)

    array = []
    head = convert_array_to_list(array)
    actual_result = convert_list_to_array(reorder_list(head))
    expected_result = []
    actual_result.must_equal(expected_result)

    array = [1]
    head = convert_array_to_list(array)
    actual_result = convert_list_to_array(reorder_list(head))
    expected_result = [1]
    actual_result.must_equal(expected_result)

    array = [1,2]
    head = convert_array_to_list(array)
    actual_result = convert_list_to_array(reorder_list(head))
    expected_result = [1,2]
    actual_result.must_equal(expected_result)

    array = [1,2,3]
    head = convert_array_to_list(array)
    actual_result = convert_list_to_array(reorder_list(head))
    expected_result = [1,3,2]
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
