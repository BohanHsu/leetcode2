require 'minitest/autorun'
require '../move_zeroes'

describe 'move_zeroes(nums)' do
  it 'should work1' do
    nums = [0,1,0,3,12]
    expected_result = [1,3,12,0,0]
    move_zeroes(nums)
    nums.must_equal(expected_result)

    nums = []
    expected_result = []
    move_zeroes(nums)
    nums.must_equal(expected_result)
  end

  it 'should work2' do
    nums = [0, 1]
    expected_result = [1,0]
    move_zeroes(nums)
    nums.must_equal(expected_result)
  end
end
