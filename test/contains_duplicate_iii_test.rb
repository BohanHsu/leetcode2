require 'minitest/autorun'
require '../contains_duplicate_iii'

describe 'contains_nearby_almost_duplicate(nums, k, t)' do
  it 'should work1' do
    nums = [1,10,100,1,1000]
    k = 9
    t = 2
    expected_result = true
    contains_nearby_almost_duplicate(nums, k, t).must_equal(expected_result)

    k = 3
    t = 0
    expected_result = true
    contains_nearby_almost_duplicate(nums, k, t).must_equal(expected_result)

    k = 0
    t = 2
    expected_result = false
    contains_nearby_almost_duplicate(nums, k, t).must_equal(expected_result)

    k = 2
    t = 8
    expected_result = false
    contains_nearby_almost_duplicate(nums, k, t).must_equal(expected_result)
  end

  it 'should work2' do
    nums = [1,10,100,1,1000]
    k = 0
    t = 0
    expected_result = false
    contains_nearby_almost_duplicate(nums, k, t).must_equal(expected_result)
  end
end
