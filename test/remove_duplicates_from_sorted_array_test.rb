require 'minitest/autorun'
require '../remove_duplicates_from_sorted_array'

describe 'remove_duplicates(nums)' do
  it 'should work1' do
    nums = [1,1,2]
    expected_result = check_result(nums)
    actual_result = remove_duplicates(nums)
    actual_result.must_equal(expected_result.length)
    nums[0...actual_result].must_equal(expected_result)

    nums = [1,1,1,1,1,1,1,1,2,2,2,2,2]
    expected_result = check_result(nums)
    actual_result = remove_duplicates(nums)
    actual_result.must_equal(expected_result.length)
    nums[0...actual_result].must_equal(expected_result)

    nums = [1,1,1,1,1,1,1,1,2,2,2,2,2,3,4,4]
    expected_result = check_result(nums)
    actual_result = remove_duplicates(nums)
    actual_result.must_equal(expected_result.length)
    nums[0...actual_result].must_equal(expected_result)


    nums = []
    expected_result = check_result(nums)
    actual_result = remove_duplicates(nums)
    actual_result.must_equal(expected_result.length)
    nums[0...actual_result].must_equal(expected_result)
  end
end

def check_result(nums)
  hsh = {}
  nums.each do |num|
    hsh[num] = true
  end
  return hsh.keys.sort
end
