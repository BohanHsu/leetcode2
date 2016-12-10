require 'minitest/autorun'
require '../merge_k_sorted_lists'

describe 'merge_k_lists(lists)' do
  it 'should work1' do
    arrays = [
      [1,3,45,5,23,3],
      [],
      [3424,234,53,2,5,3,21,45,23,5234,32],
      [],
      [4,3,2,1]
    ]
    arrays.each {|arr| arr.sort!}
    lists = arrays.map do |arr|
      convert_array_to_list(arr)
    end
    result_list = merge_k_lists(lists)
    actual_result = convert_list_to_array(result_list)
    actual_result.must_equal((arrays.inject([]) {|memo, obj| memo + obj}).sort)

    arrays = [
    ]
    arrays.each {|arr| arr.sort!}
    lists = arrays.map do |arr|
      convert_array_to_list(arr)
    end
    result_list = merge_k_lists(lists)
    actual_result = convert_list_to_array(result_list)
    actual_result.must_equal((arrays.inject([]) {|memo, obj| memo + obj}).sort)
  end
end

describe 'Heap' do
  it 'should work2' do
    heap = Heap.new(5)

    heap.empty?.must_equal(true)
    heap.push(4,:d)
    heap.empty?.must_equal(false)
    heap.push(1,:a)
    heap.empty?.must_equal(false)
    heap.push(3,:c)
    heap.empty?.must_equal(false)
    heap.push(2,:b)
    heap.empty?.must_equal(false)
    heap.push(5,:e)
    heap.empty?.must_equal(false)

    heap.pop.must_equal(:a)
    heap.empty?.must_equal(false)
    heap.pop.must_equal(:b)
    heap.empty?.must_equal(false)

    heap.push(6, :a)
    heap.empty?.must_equal(false)
    
    heap.pop.must_equal(:c)
    heap.empty?.must_equal(false)
    heap.pop.must_equal(:d)
    heap.empty?.must_equal(false)
    heap.pop.must_equal(:e)
    heap.empty?.must_equal(false)
    heap.pop.must_equal(:a)
    heap.empty?.must_equal(true)
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
