require 'minitest/autorun'
require '../house_robber'

describe 'rob(nums)' do
  it 'should work1' do
    nums = []
    expected_result = 0
    rob(nums).must_equal(expected_result)

    nums = [1]
    expected_result = 1
    rob(nums).must_equal(expected_result)

    nums = [1,2]
    expected_result = 2
    rob(nums).must_equal(expected_result)

    nums = [2,1]
    expected_result = 2
    rob(nums).must_equal(expected_result)

    nums = [1,2,2]
    expected_result = 3
    rob(nums).must_equal(expected_result)

    nums = [1,5,2]
    expected_result = 5
    rob(nums).must_equal(expected_result)
  end
end
