require 'minitest/autorun'
require '../remove_element'

describe 'remove_element(nums, val)' do
  it 'should work1' do
    nums = [4,3,2,1,3,4,1,4]
    val = 4
    expected_result = burtal_force(nums, val)
    len = expected_result.length
    remove_element(nums, val).must_equal(len)
    nums[0...len].sort.must_equal(expected_result)

    nums = [4,3,2,1,3,4,1,4]
    val = 8
    expected_result = burtal_force(nums, val)
    len = expected_result.length
    remove_element(nums, val).must_equal(len)
    nums[0...len].sort.must_equal(expected_result)
  end

  it 'should work2' do
    nums = [4]
    val = 4
    expected_result = burtal_force(nums, val)
    len = expected_result.length
    remove_element(nums, val).must_equal(len)
    nums[0...len].sort.must_equal(expected_result)

    nums = [4,4]
    val = 4
    expected_result = burtal_force(nums, val)
    len = expected_result.length
    remove_element(nums, val).must_equal(len)
    nums[0...len].sort.must_equal(expected_result)
  end
end

def burtal_force(arr, val)
  return arr.select {|ele| ele != val}.sort
end
