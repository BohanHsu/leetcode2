require 'minitest/autorun'
require '../delete_node_in_a_linked_list'

describe 'delete_node(node)' do
  it 'should work1' do
    array = [1,2,3,4]
    head = convert_array_to_list(array)
    delete_node(head)
    actual_result = convert_list_to_array(head)
    expected_result = [2,3,4]
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
