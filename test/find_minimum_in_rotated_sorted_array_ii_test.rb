require 'minitest/autorun'
require '../find_minimum_in_rotated_sorted_array_ii'

describe 'find_min(nums)' do
  it 'should work1' do
    nums = [1,1,1,1,1,2,2,2,2,0,0,0,0]
    find_min(nums).must_equal(0)

    nums.length.times do |i|
      nums = nums[1...nums.length] + nums[0...1]
      find_min(nums).must_equal(0)
    end
  end

  it 'should work3' do
    200.times do |k|
      nums = []
      (k + 1).times do |i|
        (i + 1).times do |j|
          nums << i
        end
      end

      find_min(nums).must_equal(0)
    end
  end

  it 'should work2' do
    nums = [0]
    find_min(nums).must_equal(0)

    nums = [0, 0]
    find_min(nums).must_equal(0)

    nums = [0, 0, 0]
    find_min(nums).must_equal(0)

    nums = [0, 0, 0, 0]
    find_min(nums).must_equal(0)

    nums = [0, 1]
    find_min(nums).must_equal(0)

    nums = [0, 1, 1]
    find_min(nums).must_equal(0)
  end
end
