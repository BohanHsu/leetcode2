require 'minitest/autorun'
require '../remove_linked_list_elements'

describe 'remove_elements(head, val)' do
  it 'should work1' do
    array = [1,2,6,3,4,5,6]
    head = convert_array_to_list(array)
    val = 6
    result_head = remove_elements(head, val)
    actual_array = convert_list_to_array(result_head)
    expected_result = [1,2,3,4,5]
    actual_array.must_equal(expected_result)


    array = [6,6,6,6,6,1,2,6,6,6,6,6,6,6,6,3,4,5,6]
    head = convert_array_to_list(array)
    val = 6
    result_head = remove_elements(head, val)
    actual_array = convert_list_to_array(result_head)
    expected_result = [1,2,3,4,5]
    actual_array.must_equal(expected_result)

    array = []
    head = convert_array_to_list(array)
    val = 6
    result_head = remove_elements(head, val)
    actual_array = convert_list_to_array(result_head)
    expected_result = []
    actual_array.must_equal(expected_result)

    array = [6,6,6,6,6,6,6]
    head = convert_array_to_list(array)
    val = 6
    result_head = remove_elements(head, val)
    actual_array = convert_list_to_array(result_head)
    expected_result = []
    actual_array.must_equal(expected_result)
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
