require 'minitest/autorun'
require '../search_insert_position'

describe 'search_insert(nums, target)' do
  it 'should work1' do
    nums = [1,2,3,4,5,6,7]
    target = 5
    expected_result = 4
    search_insert(nums, target).must_equal(expected_result)

    target = -1
    expected_result = 0
    search_insert(nums, target).must_equal(expected_result)

    target = 9
    expected_result = 7
    search_insert(nums, target).must_equal(expected_result)

    nums = [1,2,3,5,6,7]
    target = 4
    expected_result = 3
    search_insert(nums, target).must_equal(expected_result)
  end
end
