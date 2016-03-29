require 'minitest/autorun'
require '../find_median_from_data_stream'

describe 'MedianFinder' do
  it 'should work1' do
    mf = MedianFinder.new
    mf.add_num(1)
    mf.add_num(2)
    mf.find_median.must_equal(1.5)
    mf.add_num(3)
    mf.find_median.must_equal(2)
  end

  it 'should work2' do
    mf = MedianFinder.new
    mf.add_num(0)
    mf.add_num(0)
    mf.find_median.must_equal(0)
  end
end

describe 'PriorityQueue' do
  it 'should work as max_heap' do
    array = 20.times.map do |i|
      i
    end

    in_array = array

    pq = PriorityQueue.new(PriorityQueue::Priority::MAX_HEAP)

    in_array.each do |i|
      pq.add(i)
    end

    out_array = []
    while pq.size > 0 do
      out_array << pq.remove
    end

    out_array.must_equal(array.reverse)
  end

  it 'should work as max_heap' do
    array = 20.times.map do |i|
      i
    end.reverse

    in_array = array

    pq = PriorityQueue.new(PriorityQueue::Priority::MIN_HEAP)

    in_array.each do |i|
      pq.add(i)
    end

    out_array = []
    while pq.size > 0 do
      out_array << pq.remove
    end

    out_array.must_equal(array.reverse)
  end
end
