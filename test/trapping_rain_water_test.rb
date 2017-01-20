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
  end
end
