require 'minitest/autorun'
require '../reverse_linked_list_ii'

describe 'reverse_between(head, m, n)' do
  it 'should work1' do
    array = [1,2,3,4,5]
    expected_result = [1,4,3,2,5]
    m = 2
    n = 4
    head = convert_array_to_list(array)
    head = reverse_between(head, m, n)
    actual_result = convert_list_to_array(head)
    actual_result.must_equal(expected_result)

    array = [1,2,3,4,5]
    expected_result = [4,3,2,1,5]
    m = 1
    n = 4
    head = convert_array_to_list(array)
    head = reverse_between(head, m, n)
    actual_result = convert_list_to_array(head)
    actual_result.must_equal(expected_result)

    array = [1,2,3,4,5]
    expected_result = [5,4,3,2,1]
    m = 1
    n = 5
    head = convert_array_to_list(array)
    head = reverse_between(head, m, n)
    actual_result = convert_list_to_array(head)
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
