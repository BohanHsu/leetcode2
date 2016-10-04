require 'minitest/autorun'
require '../two_sum'

describe 'two_sum(nums, target)' do
  it 'should work1' do
    nums = [2, 7, 11, 15]
    target = 9
    expected_result = [0, 1]
    two_sum(nums, target).must_equal(expected_result)

    nums = [3,2,4]
    target = 6
    expected_result = [1, 2]
    two_sum(nums, target).must_equal(expected_result)

    nums = [7, 11, 15, 2]
    target = 9
    expected_result = [0, 3]
    two_sum(nums, target).must_equal(expected_result)
  end

  it 'should work2' do
    nums = [-1,-2,-3,-4,-5]
    target = -8
    expected_result = [2, 4]
    two_sum(nums, target).must_equal(expected_result)
  end
end
