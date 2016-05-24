require 'minitest/autorun'
require '../minimum_size_subarray_sum'

describe 'min_sub_array_len(s, nums)' do
  it 'should work1' do
    s = 7
    nums = [2,3,1,2,4,3]
    expected_result = 2
    min_sub_array_len(s, nums).must_equal(expected_result)

    s = 8
    nums = [3,3,3,9]
    expected_result = 1
    min_sub_array_len(s, nums).must_equal(expected_result)

    s = 8
    nums = [9,3,3,3,9]
    expected_result = 1
    min_sub_array_len(s, nums).must_equal(expected_result)

    s = 88888
    nums = [9,3,3,3,9]
    expected_result = 0
    min_sub_array_len(s, nums).must_equal(expected_result)
  end
end
