require 'minitest/autorun'
require '../sort_list'

describe 'sort_list(head)' do
  it 'should work1' do
    array = []
    expected_result = array.sort
    #puts "convert_array_to_list(array)=#{convert_array_to_list(array)}"
    convert_list_to_array(sort_list(convert_array_to_list(array))).must_equal(expected_result)

    array = [1]
    expected_result = array.sort
    convert_list_to_array(sort_list(convert_array_to_list(array))).must_equal(expected_result)

    array = [1, 1]
    expected_result = array.sort
    convert_list_to_array(sort_list(convert_array_to_list(array))).must_equal(expected_result)

    array = [1, 0]
    expected_result = array.sort
    convert_list_to_array(sort_list(convert_array_to_list(array))).must_equal(expected_result)

    array = [0, 1]
    expected_result = array.sort
    convert_list_to_array(sort_list(convert_array_to_list(array))).must_equal(expected_result)
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
