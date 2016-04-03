require 'minitest/autorun'
require '../find_the_duplicate_number'

describe 'find_duplicate(nums)' do
  it 'should work1' do
    nums = [1,2,3,4,5,6,2]
    expected_result = 2
    find_duplicate(nums).must_equal(expected_result)

    nums = [1,2,2,4,5,6,2]
    expected_result = 2
    find_duplicate(nums).must_equal(expected_result)

    nums = [1,6,5,4,3,2,2]
    expected_result = 2
    find_duplicate(nums).must_equal(expected_result)
  end
end
