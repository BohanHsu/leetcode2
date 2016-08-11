require 'minitest/autorun'
require '../partition_list'

describe 'partition(head, x)' do
  it 'should work1' do
    array = [1,4,3,2,5,2]
    x = 3
    head = convert_array_to_list(array)
    new_head = partition(head, x)
    actual_result = convert_list_to_array(new_head)
    expected_result = [1,2,2,4,3,5]
    actual_result.must_equal(expected_result)

    array = [1,4,3,2,5,2]
    x = 0
    head = convert_array_to_list(array)
    new_head = partition(head, x)
    actual_result = convert_list_to_array(new_head)
    expected_result = [1,4,3,2,5,2]
    actual_result.must_equal(expected_result)

    array = [1,4,3,2,5,2]
    x = 1
    head = convert_array_to_list(array)
    new_head = partition(head, x)
    actual_result = convert_list_to_array(new_head)
    expected_result = [1,4,3,2,5,2]
    actual_result.must_equal(expected_result)

    array = [1,4,3,2,5,2]
    x = 10
    head = convert_array_to_list(array)
    new_head = partition(head, x)
    actual_result = convert_list_to_array(new_head)
    expected_result = [1,4,3,2,5,2]
    actual_result.must_equal(expected_result)

    array = [1,4,3,2,5,2,10]
    x = 10
    head = convert_array_to_list(array)
    new_head = partition(head, x)
    actual_result = convert_list_to_array(new_head)
    expected_result = [1,4,3,2,5,2,10]
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
