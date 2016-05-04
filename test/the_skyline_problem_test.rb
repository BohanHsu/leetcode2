require 'minitest/autorun'
require '../the_skyline_problem'

describe 'get_skyline(buildings)' do
  it 'should work2' do
    buildings = [ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]
    expected_result = [ [2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0] ]
    get_skyline(buildings).must_equal(expected_result)
  end

  it 'should work3' do
    buildings = []
    expected_result = []
    get_skyline(buildings).must_equal(expected_result)
  end

  it 'should work4' do
    buildings = [[0,2147483647,2147483647]]
    
    expected_result = [[0,2147483647], [2147483647, 0]]
    get_skyline(buildings).must_equal(expected_result)
  end
end

describe 'MaxHeap' do
  before(:each) do
    @heap = MaxHeap.new
  end

  it 'should work1' do
    @heap.empty?.must_equal(true)
    b1 = [1,2,10]
    @heap.push(b1[2], b1)
    @heap.peek.must_equal(b1)
    b2 = [1,2,11]
    @heap.push(b2[2], b2)
    @heap.peek.must_equal(b2)
    @heap.empty?.must_equal(false)
    b3 = [1,2,12]
    @heap.push(b3[2], b3)
    @heap.pop.must_equal(b3)
    b0 = [1,2,9]
    @heap.push(b0[2], b0)
    @heap.pop.must_equal(b2)
    @heap.peek.must_equal(b1)
    @heap.pop.must_equal(b1)
    @heap.peek.must_equal(b0)
    @heap.pop.must_equal(b0)
    @heap.empty?.must_equal(true)
  end
end
