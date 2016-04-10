require 'minitest/autorun'
require '../single_number'

describe 'single_number(nums)' do
  it 'should work1' do
    expected_result = 10
    nums = [1,2,3,44,45,34,36] * 2 + [expected_result]
    single_number(nums).must_equal(expected_result)

    expected_result = 10
    nums = [] * 2 + [expected_result]
    single_number(nums).must_equal(expected_result)
  end
end
