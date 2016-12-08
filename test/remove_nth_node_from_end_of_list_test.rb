require 'minitest/autorun'
require '../remove_nth_node_from_end_of_list'

describe 'remove_nth_from_end(head, n)' do
  it 'should work1' do 
    arr = [1,2,3,4,5]
    n = 2
    expected_result = [1,2,3,5]
    head = convert_array_to_list(arr)
    actual = convert_list_to_array(remove_nth_from_end(head, n))
    actual.must_equal(expected_result)

    arr = [1,2,3,4,5]
    n = 5
    expected_result = [2,3,4,5]
    head = convert_array_to_list(arr)
    actual = convert_list_to_array(remove_nth_from_end(head, n))
    actual.must_equal(expected_result)
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
