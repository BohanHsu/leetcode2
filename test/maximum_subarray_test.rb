require 'minitest/autorun'
require '../maximum_subarray'

describe 'max_sub_array(nums)' do
  it 'should work1' do
    nums = [-2,1,-3,4,-1,2,1,-5,4]
    expected_result = 6
    max_sub_array(nums).must_equal(expected_result)

    nums = [6]
    expected_result = 6
    max_sub_array(nums).must_equal(expected_result)
  end

  it 'should work2' do
    nums = [-6,-1]
    expected_result = -1
    max_sub_array(nums).must_equal(expected_result)

    nums = [-1,-6]
    expected_result = -1
    max_sub_array(nums).must_equal(expected_result)

    nums = [-6]
    expected_result = -6
    max_sub_array(nums).must_equal(expected_result)
  end
end
