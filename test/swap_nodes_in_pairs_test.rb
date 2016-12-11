require 'minitest/autorun'
require '../swap_nodes_in_pairs'

describe 'swap_pairs(head)' do
  it 'should work1' do
    arr = [1,2,3,4,5]
    expected_result = [2,1,4,3,5]
    actual_result = convert_list_to_array(swap_pairs(convert_array_to_list(arr)))
    actual_result.must_equal(expected_result)

    arr = [1,2,3,4]
    expected_result = [2,1,4,3]
    actual_result = convert_list_to_array(swap_pairs(convert_array_to_list(arr)))
    actual_result.must_equal(expected_result)

    arr = [1]
    expected_result = [1]
    actual_result = convert_list_to_array(swap_pairs(convert_array_to_list(arr)))
    actual_result.must_equal(expected_result)

    arr = []
    expected_result = []
    actual_result = convert_list_to_array(swap_pairs(convert_array_to_list(arr)))
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
