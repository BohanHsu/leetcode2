require 'minitest/autorun'
require '../flatten_nested_list_iterator'

describe 'NestedIterator' do
  it 'should work1' do
    array = [[1,2],3,[4,5]]
    expected_result = [1,2,3,4,5]
    nested_list = nested_array_to_obj(array).get_list
    itr = NestedIterator.new(nested_list)
    values = []
    while values.length < expected_result.length do
      itr.has_next.must_equal(true)
      values << itr.next
      values[values.length - 1].must_equal(expected_result[values.length - 1])
    end
    itr.has_next.must_equal(false)

    array = [[1,2],3,[4,[],5,[[[]]]]]
    expected_result = [1,2,3,4,5]
    nested_list = nested_array_to_obj(array).get_list
    itr = NestedIterator.new(nested_list)
    values = []
    while values.length < expected_result.length do
      itr.has_next.must_equal(true)
      values << itr.next
      values[values.length - 1].must_equal(expected_result[values.length - 1])
    end
    itr.has_next.must_equal(false)

    array = [[1,2],3,[4,[],5,[[[6]]],7]]
    expected_result = [1,2,3,4,5,6,7]
    nested_list = nested_array_to_obj(array).get_list
    itr = NestedIterator.new(nested_list)
    values = []
    while values.length < expected_result.length do
      itr.has_next.must_equal(true)
      values << itr.next
      values[values.length - 1].must_equal(expected_result[values.length - 1])
    end
    itr.has_next.must_equal(false)

    array = [[1,2],3,[4,[],5,[[[6,9]]],7],8]
    expected_result = [1,2,3,4,5,6,9,7,8]
    nested_list = nested_array_to_obj(array).get_list
    itr = NestedIterator.new(nested_list)
    values = []
    while values.length < expected_result.length do
      itr.has_next.must_equal(true)
      values << itr.next
      values[values.length - 1].must_equal(expected_result[values.length - 1])
    end
    itr.has_next.must_equal(false)

    array = [[1,2],3,[4,[],5,[10,[11,[6,9]],12],7],8]
    expected_result = [1,2,3,4,5,10,11,6,9,12,7,8]
    nested_list = nested_array_to_obj(array).get_list
    itr = NestedIterator.new(nested_list)
    values = []
    while values.length < expected_result.length do
      itr.has_next.must_equal(true)
      values << itr.next
      values[values.length - 1].must_equal(expected_result[values.length - 1])
    end
    itr.has_next.must_equal(false)
  end

  it 'should work2' do

  end
end

def nested_array_to_obj(array)
  new_arr = array.map do |element|
    if element.class == Array
      nested_array_to_obj(element)
    else
      num_to_obj(element)
    end
  end
  return NestedInteger.new(false, new_arr)
end

def num_to_obj(integer)
  return NestedInteger.new(true, integer)
end

class NestedInteger
  def initialize(is_integer, val)
    @is_integer = is_integer
    if is_integer
      @integer = val
      @list = nil
    else
      @integer = nil
      @list = val
    end
  end

  def is_integer()
    "
        Return true if this NestedInteger holds a single integer, rather than a nested list.
        @return {Boolean}
    "
    return @is_integer
  end

  def get_integer()
    "
        Return the single integer that this NestedInteger holds, if it holds a single integer
        Return nil if this NestedInteger holds a nested list
        @return {Integer}
    "
    return @integer
  end

  def get_list()
    "
        Return the nested list that this NestedInteger holds, if it holds a nested list
        Return nil if this NestedInteger holds a single integer
        @return {NestedInteger[]}
    "
    return @list
  end

  def to_s
    if @is_integer
      return @integer.to_s
    else
      str = "["
      @list.each_with_index do |ele, idx|
        str += ele.to_s
        if idx != @list.length - 1
          str += ","
        end
      end
      str += "]"
      return str
    end
  end
end
