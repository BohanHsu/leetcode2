require 'minitest/autorun'
require '../trapping_rain_water'

describe 'find_picks(height)' do
  it 'should work1' do
    height = [0,1,0,2,1,0,1,3,2,1,2,1]
    expected_result = [1,3,7,10]
    find_picks(height).must_equal(expected_result)
  end
end

describe 'pair_picks(height, picks)' do
  it 'should work2' do
    height = [0,1,0,2,1,0,1,3,2,1,2,1]
    picks = [1,3,7,10]
    expected_result = [[1,3], [3,7], [7,10]]
    pair_picks(height, picks).must_equal(expected_result)
  end
end

describe 'my_trap(height)' do
  it 'should work3' do
    height = [0,1,0,2,1,0,1,3,2,1,2,1]
    expected_result = 6
    my_trap(height).must_equal(expected_result)

    height = [5,4,1,2]
    expected_result = 1
    my_trap(height).must_equal(expected_result)

    height = [5,2,1,2,1,5]
    expected_result = 14
    my_trap(height).must_equal(expected_result)

    height = [5,5,1,7,1,1,5,2,7,6]
    expected_result = 23
    my_trap(height).must_equal(expected_result)
  end

  it 'should work4' do
    height = [9,6,8,8,5,6,3]
    expected_result = 3
    my_trap(height).must_equal(expected_result)
  end
end
