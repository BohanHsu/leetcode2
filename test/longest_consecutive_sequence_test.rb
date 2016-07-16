require 'minitest/autorun'
require '../longest_consecutive_sequence'

describe 'longest_consecutive(nums)' do
  it 'should work1' do
    nums = [100, 4, 200, 1, 3, 2]
    expected_result = 4
    longest_consecutive(nums).must_equal(expected_result)

    nums = [1, 3, 2]
    expected_result = 3
    longest_consecutive(nums).must_equal(expected_result)

    nums = [1, 4]
    expected_result = 1
    longest_consecutive(nums).must_equal(expected_result)

    nums = [1]
    expected_result = 1
    longest_consecutive(nums).must_equal(expected_result)

    nums = []
    expected_result = 0
    longest_consecutive(nums).must_equal(expected_result)
  end
end
