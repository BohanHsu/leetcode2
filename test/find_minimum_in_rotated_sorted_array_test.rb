require 'minitest/autorun'
require '../find_minimum_in_rotated_sorted_array'

describe 'find_min(nums)' do
  it 'should work1' do
    (1...150).each do |k|
      nums = k.times.map do |i|
        i
      end
      (0...k).each do |j|
        nums = nums[j...nums.length] + nums[0...j]
        find_min(nums).must_equal(0)
      end
    end
  end

  it 'should work2' do
    k = 2
    j = 0

    nums = k.times.map do |i|
      i
    end

    nums = nums[j...nums.length] + nums[0...j]
    find_min(nums).must_equal(0)
  end
end
