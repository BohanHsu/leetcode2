# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  return [] if nums.empty?

  result = nums.map do |i|
    nil
  end

  result[nums.length - 1] = nums[nums.length - 1]

  (1...nums.length).each do |i|
    result[nums.length - 1 - i] = nums[nums.length - 1 - i] * result[nums.length - i]
  end

  prod = 1

  (0...nums.length).each do |i|
    result[i] = prod * (i == nums.length - 1 ? 1 : result[i + 1])
    prod *= nums[i]
  end

  result
end
