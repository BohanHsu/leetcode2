require 'minitest/autorun'
require '../insert_interval'

describe 'insert(intervals, new_interval)' do
  it 'should work1' do
    intervals = [[1,3],[6,9]].map {|p| Interval.new(p[0], p[1])}
    new_interval = Interval.new(2,5)
    expected_result = [[1,5],[6,9]]
    insert(intervals, new_interval).map {|itvl| [itvl.start, itvl.end]}.must_equal(expected_result)

    intervals = [[-3,0],[1,3],[6,9],[10,12]].map {|p| Interval.new(p[0], p[1])}
    new_interval = Interval.new(2,5)
    expected_result = [[-3,0],[1,5],[6,9], [10,12]]
    insert(intervals, new_interval).map {|itvl| [itvl.start, itvl.end]}.must_equal(expected_result)

    intervals = [[-3,0],[1,3],[6,9],[10,12]].map {|p| Interval.new(p[0], p[1])}
    new_interval = Interval.new(2,7)
    expected_result = [[-3,0],[1,9],[10,12]]
    insert(intervals, new_interval).map {|itvl| [itvl.start, itvl.end]}.must_equal(expected_result)

    intervals = [[-3,0],[1,3],[6,9],[10,12]].map {|p| Interval.new(p[0], p[1])}
    new_interval = Interval.new(4,7)
    expected_result = [[-3,0],[1,3], [4,9],[10,12]]
    insert(intervals, new_interval).map {|itvl| [itvl.start, itvl.end]}.must_equal(expected_result)

    intervals = [[-3,0],[1,3],[6,9],[10,12]].map {|p| Interval.new(p[0], p[1])}
    new_interval = Interval.new(4,5)
    expected_result = [[-3,0],[1,3], [4,5], [6,9],[10,12]]
    insert(intervals, new_interval).map {|itvl| [itvl.start, itvl.end]}.must_equal(expected_result)
  end

  #it 'should work2' do
  #  intervals = [[1,5]]
  #  new_interval = [2,3]
  #  expected_result = [[1,5]]
  #  insert(intervals, new_interval).must_equal(expected_result)
  #end
end
