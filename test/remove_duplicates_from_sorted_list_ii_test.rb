require 'minitest/autorun'
require '../remove_duplicates_from_sorted_list_ii'

describe 'delete_duplicates(head)' do
  it 'should work1' do
    array = [1,1,2]
    expected_result = [2]
    head = convert_array_to_list(array)
    new_head = delete_duplicates(head)
    actual_result = convert_list_to_array(new_head)
    actual_result.must_equal(expected_result)

    array = [1,1,2,3,3]
    expected_result = [2]
    head = convert_array_to_list(array)
    new_head = delete_duplicates(head)
    actual_result = convert_list_to_array(new_head)
    actual_result.must_equal(expected_result)

    array = [1,1]
    expected_result = []
    head = convert_array_to_list(array)
    new_head = delete_duplicates(head)
    actual_result = convert_list_to_array(new_head)
    actual_result.must_equal(expected_result)

    array = []
    expected_result = []
    head = convert_array_to_list(array)
    new_head = delete_duplicates(head)
    actual_result = convert_list_to_array(new_head)
    actual_result.must_equal(expected_result)

    array = [1,2,3,4]
    expected_result = [1,2,3,4]
    head = convert_array_to_list(array)
    new_head = delete_duplicates(head)
    actual_result = convert_list_to_array(new_head)
    actual_result.must_equal(expected_result)

    array = [1]
    expected_result = [1]
    head = convert_array_to_list(array)
    new_head = delete_duplicates(head)
    actual_result = convert_list_to_array(new_head)
    actual_result.must_equal(expected_result)

    array = [1,1,2,2]
    expected_result = []
    head = convert_array_to_list(array)
    new_head = delete_duplicates(head)
    actual_result = convert_list_to_array(new_head)
    actual_result.must_equal(expected_result)
  end

  it 'should work2' do
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
