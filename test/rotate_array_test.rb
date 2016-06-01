require 'minitest/autorun'
require '../rotate_array'

describe 'rotate(nums, k)' do
  it 'should work1' do
    nums = [1,2,3,4,5,6]
    k = 2
    expected_result = [5,6,1,2,3,4]
    rotate(nums, k)
    nums.must_equal(expected_result)

    nums = [1,2,3,4,5,6]
    k = 0
    expected_result = [1,2,3,4,5,6]
    rotate(nums, k)
    nums.must_equal(expected_result)

    nums = [1,2,3,4,5,6]
    k = 104
    expected_result = [5,6,1,2,3,4]
    rotate(nums, k)
    nums.must_equal(expected_result)
  end
end
