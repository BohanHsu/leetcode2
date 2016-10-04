require 'minitest/autorun'   
require '../3sum_closest'

describe 'three_sum_closest(nums, target)' do
  it 'should work1' do
    nums = [-1, 2, 1, -4]
    target = 1
    expected_result = 2
    three_sum_closest(nums, target).must_equal(expected_result)
  end
end
