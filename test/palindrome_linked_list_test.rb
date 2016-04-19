require 'minitest/autorun'
require '../palindrome_linked_list'

describe 'is_palindrome(head)' do
  it 'should work1' do
    array = [1,2,3,4,5,4,3,2,1]
    head = convert_array_to_list(array)
    expected_result = true
    is_palindrome(head).must_equal(expected_result)
    convert_list_to_array(head).must_equal(array)

    array = []
    head = convert_array_to_list(array)
    expected_result = true
    is_palindrome(head).must_equal(expected_result)
    convert_list_to_array(head).must_equal(array)

    array = [1]
    head = convert_array_to_list(array)
    expected_result = true
    is_palindrome(head).must_equal(expected_result)
    convert_list_to_array(head).must_equal(array)

    array = [1,1]
    head = convert_array_to_list(array)
    expected_result = true
    is_palindrome(head).must_equal(expected_result)
    convert_list_to_array(head).must_equal(array)

    array = [2,1]
    head = convert_array_to_list(array)
    expected_result = false
    is_palindrome(head).must_equal(expected_result)
    convert_list_to_array(head).must_equal(array)

    array = [1,2,1]
    head = convert_array_to_list(array)
    expected_result = true
    is_palindrome(head).must_equal(expected_result)
    convert_list_to_array(head).must_equal(array)

    array = [1,2,2,1]
    head = convert_array_to_list(array)
    expected_result = true
    is_palindrome(head).must_equal(expected_result)
    convert_list_to_array(head).must_equal(array)

    array = [1,2,3]
    head = convert_array_to_list(array)
    expected_result = false
    is_palindrome(head).must_equal(expected_result)
    convert_list_to_array(head).must_equal(array)

    array = [1,2,4,1]
    head = convert_array_to_list(array)
    expected_result = false
    is_palindrome(head).must_equal(expected_result)
    convert_list_to_array(head).must_equal(array)
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
