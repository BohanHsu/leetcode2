require 'minitest/autorun'
require '../merge_intervals'

describe 'merge(intervals)' do
  it 'should work1' do
    array = [[1,3],[2,6],[8,10],[15,18]]
    expected_result = [[1,6],[8,10],[15,18]]
    actual_result = convert_intervals_to_array(merge(convert_array_to_intervals(array)))
    actual_result.must_equal(expected_result)

    array = [[1,3],[2,4],[3,5],[4,6]]
    expected_result = [[1,6]]
    actual_result = convert_intervals_to_array(merge(convert_array_to_intervals(array)))
    actual_result.must_equal(expected_result)

    array = [[1,4],[0,4]]
    expected_result = [[0,4]]
    actual_result = convert_intervals_to_array(merge(convert_array_to_intervals(array)))
    actual_result.must_equal(expected_result)

    array = [[1,4],[2,3]]
    expected_result = [[1,4]]
    actual_result = convert_intervals_to_array(merge(convert_array_to_intervals(array)))
    actual_result.must_equal(expected_result)
  end

  it 'should work2' do
    array = [[2,3],[4,5],[6,7],[8,9],[1,10]]
    expected_result = [[1,10]]
    actual_result = convert_intervals_to_array(merge(convert_array_to_intervals(array)))
    actual_result.must_equal(expected_result)
    
  end
end

def convert_array_to_intervals(array)
  array.map do |pair|
    Interval.new(pair[0], pair[1])
  end
end

def convert_intervals_to_array(intervals)
  intervals.map do |interval|
    [interval.start, interval.end]
  end
end
