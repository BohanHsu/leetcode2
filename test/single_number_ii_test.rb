require 'minitest/autorun'
require '../single_number_ii'

describe 'single_number(nums)' do
  it 'should work1' do
    expected_result = 10
    nums = [1,4,6,3,45,54,23,78,9877] * 3 + [expected_result]
    single_number(nums).must_equal(expected_result)

    expected_result = 10
    nums = [] * 3 + [expected_result]
    single_number(nums).must_equal(expected_result)
  end

  it 'should work2' do
    nums = [-2,-2,1,1,-3,1,-3,-3,-4,-2]
    expected_result = -4
    single_number(nums).must_equal(expected_result)

    nums = [4,4,4,-4]
    expected_result = -4
    single_number(nums).must_equal(expected_result)
  end
end
