require 'minitest/autorun'
require '../contains_duplicate_ii'

describe 'contains_nearby_duplicate(nums, k)' do
  it 'should work1' do
    nums = [1,2,3,4,5,6,1,2,3]
    k = 6
    expected_result = true
    contains_nearby_duplicate(nums, k).must_equal(expected_result)

    nums = [1,2,3,4,5,6,1,2,3]
    k = 5
    expected_result = false
    contains_nearby_duplicate(nums, k).must_equal(expected_result)

    nums = [1,2,3,4,5,6]
    k = 5
    expected_result = false
    contains_nearby_duplicate(nums, k).must_equal(expected_result)
  end
end
