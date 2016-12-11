require 'minitest/autorun'
require '../reverse_nodes_in_k-group'

describe 'reverse_k_group(head, k)' do
  it 'should work1' do
    arr = [1,2,3,4,5]
    k = 2
    expected_result = [2,1,4,3,5]
    actual_result = convert_list_to_array(reverse_k_group(convert_array_to_list(arr), k))
    actual_result.must_equal(expected_result)

    arr = [1,2,3,4,5]
    k = 3
    expected_result = [3,2,1,4,5]
    actual_result = convert_list_to_array(reverse_k_group(convert_array_to_list(arr), k))
    actual_result.must_equal(expected_result)

    arr = [1,2,3,4,5]
    k = 4
    expected_result = [4,3,2,1,5]
    actual_result = convert_list_to_array(reverse_k_group(convert_array_to_list(arr), k))
    actual_result.must_equal(expected_result)

    arr = [1,2,3,4,5]
    k = 5
    expected_result = [5,4,3,2,1]
    actual_result = convert_list_to_array(reverse_k_group(convert_array_to_list(arr), k))
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
