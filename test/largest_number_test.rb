require 'minitest/autorun'
require '../largest_number'

describe 'largest_number(nums)' do
  it 'should work1' do
    nums = [3, 30, 34, 5, 9]
    expected_result = "9534330"
    largest_number(nums).must_equal(expected_result)

    nums = [121, 12]
    expected_result = "12121"
    largest_number(nums).must_equal(expected_result)

    nums = [0, 0]
    expected_result = "0"
    largest_number(nums).must_equal(expected_result)
  end


end

