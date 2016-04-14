require 'minitest/autorun'
require '../sliding_window_maximum'

describe 'max_sliding_window(nums, k)' do
  it 'should work1' do
    nums = [1,3,-1,-3,5,3,6,7]
    k = 3
    expected_result = [3,3,5,5,6,7]
    max_sliding_window(nums, k).must_equal(expected_result)

    nums = []
    k = 0
    expected_result = []
    max_sliding_window(nums, k).must_equal(expected_result)

    nums = [1]
    k = 1
    expected_result = [1]
    max_sliding_window(nums, k).must_equal(expected_result)

    nums = [1]
    k = 0
    expected_result = []
    max_sliding_window(nums, k).must_equal(expected_result)
  end

  it 'should work2' do
    nums = [-95,92,-85,59,-59,-14,88,-39,2,92,94,79,78,-58,37,48,63,-91,91,74,-28,39,90,-9,-72,-88,-72,93,38,14,-83,-2,21,4,-75,-65,3,63,100,59,-48,43,35,-49,48,-36,-64,-13,-7,-29,87,34,56,-39,-5,-27,-28,10,-57,100,-43,-98,19,-59,78,-28,-91,67,41,-64,76,5,-58,-89,83,26,-7,-82,-32,-76,86,52,-6,84,20,51,-86,26,46,35,-23,30,-51,54,19,30,27,80,45,22]
    k = 10
    expected_result = [92,94,94,94,94,94,94,94,94,94,94,91,91,91,91,91,91,91,93,93,93,93,93,93,93,93,93,93,63,100,100,100,100,100,100,100,100,100,100,59,48,87,87,87,87,87,87,87,87,87,100,100,100,100,100,100,100,100,100,100,78,78,78,78,78,83,83,83,83,83,83,86,86,86,86,86,86,86,86,86,86,84,84,84,54,54,54,54,80,80,80]
    max_sliding_window(nums, k).must_equal(expected_result)
  end
end

describe 'Heap' do
  before(:each) do
    @heap = Heap.new(5)
  end

  it 'should work' do
    5.times do |i|
      @heap.add(5 - i)
    end

    @heap.pop.must_equal(5)

    @heap.add 6
    @heap.pop.must_equal(6)

    @heap.add 2
    @heap.peek.must_equal(4)
    @heap.pop.must_equal(4)
    @heap.peek.must_equal(3)
    @heap.pop.must_equal(3)
    @heap.peek.must_equal(2)
    @heap.pop.must_equal(2)
    @heap.peek.must_equal(2)
    @heap.pop.must_equal(2)
    @heap.peek.must_equal(1)
    @heap.pop.must_equal(1)

    5.times do |i|
      @heap.add(5 - i)
    end

    @heap.pop.must_equal(5)
    @heap.add(4)
    @heap.delete(4)
    @heap.delete(4)
    @heap.delete(3)
    @heap.delete(1)
    @heap.pop.must_equal(2)
  end
end
