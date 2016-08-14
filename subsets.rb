# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  return [[]] if nums.empty?
  return subsets_helper(nums) + [[]]
end

def subsets_helper(nums)
  if nums.length == 1
    return [nums]
  end

  parts = subsets_helper(nums[1...nums.length])
  return parts + (parts.map do |sub|
    [nums[0]] + sub
  end) + [[nums[0]]]
end
