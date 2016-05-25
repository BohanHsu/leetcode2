require 'minitest/autorun'
require '../reverse_linked_list'

describe 'reverse_list(head)' do
  it 'should work1' do
    array = [1,2,3,4,5]
    rev_arr = array.reverse
    head = convert_array_to_list(array)
    rev_head = reverse_list(head)
    actual_result = convert_list_to_array(rev_head)
    actual_result.must_equal(rev_arr)

    array = [1,2,3,4]
    rev_arr = array.reverse
    head = convert_array_to_list(array)
    rev_head = reverse_list(head)
    actual_result = convert_list_to_array(rev_head)
    actual_result.must_equal(rev_arr)

    array = [1]
    rev_arr = array.reverse
    head = convert_array_to_list(array)
    rev_head = reverse_list(head)
    actual_result = convert_list_to_array(rev_head)
    actual_result.must_equal(rev_arr)

    array = [1]
    rev_arr = array.reverse
    head = convert_array_to_list(array)
    rev_head = reverse_list(head)
    actual_result = convert_list_to_array(rev_head)
    actual_result.must_equal(rev_arr)
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
