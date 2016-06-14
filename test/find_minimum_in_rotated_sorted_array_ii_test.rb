require 'minitest/autorun'
require '../find_minimum_in_rotated_sorted_array_ii'

describe 'find_min(nums)' do
  it 'should work1' do
    nums = [1,1,1,1,1,2,2,2,2,0]
    find_min(nums).must_equal(0)
  end
end
