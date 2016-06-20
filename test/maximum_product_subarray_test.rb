require 'minitest/autorun'
require '../maximum_product_subarray'

describe 'max_product(nums)' do
  it 'should work1' do
    nums = [2,3,-2,4]
    expected_result = 6
    max_product(nums).must_equal(expected_result)
    brutal_force(nums).must_equal(expected_result)
    max_product(nums).must_equal(brutal_force(nums))

    nums = [2,3,-2,4,0, 2,3,-2,-4]
    max_product(nums).must_equal(brutal_force(nums))

    nums = []
    max_product(nums).must_equal(brutal_force(nums))

    nums = [1]
    max_product(nums).must_equal(brutal_force(nums))

    nums = [0]
    max_product(nums).must_equal(brutal_force(nums))
  end
end

def brutal_force(nums)
  cur_max = -Float::INFINITY
  i = 0
  while i < nums.length do
    j = i
    res = 1
    while j < nums.length do
      res *= nums[j]
      cur_max = [cur_max, res].max
      j += 1
    end
    i += 1
  end
  cur_max
end
