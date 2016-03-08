require 'minitest/autorun'
require '../wiggle_list_ii'

describe 'wiggle_sort(nums)' do
  it 'should work1' do
    nums = [1,5,1,1,6,4]
    wiggle_sort(nums)
    check_wiggle_list(nums).must_equal(true)

    nums = [1,3,2,2,3,1]
    wiggle_sort(nums)
    check_wiggle_list(nums).must_equal(true)

    nums = [1,1,1,2,2,3,3,4,4]
    wiggle_sort(nums)
    check_wiggle_list(nums).must_equal(true)

    nums = [1,1,1,1,1,2,2,2,2]
    wiggle_sort(nums)
    check_wiggle_list(nums).must_equal(true)

    nums = [3,4,3,1,1,1,1]
    wiggle_sort(nums)
    check_wiggle_list(nums).must_equal(true)
  end

  it 'should work2' do
    nums = [2,1,1,2,1,3,3,3,1,3,1,3,2]
    wiggle_sort(nums)
    check_wiggle_list(nums).must_equal(true)
  end
end

def check_wiggle_list(nums)
  i = 0
  while i < nums.length - 1 do
    if i.even?
      return false if nums[i] >= nums[i+1]
    else
      return false if nums[i] <= nums[i+1]
    end
    i += 1
  end
  true
end
