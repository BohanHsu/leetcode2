# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  return true if nums.empty?

  i = 0
  max_idx = nums[0]

  while i <= max_idx && max_idx < nums.length - 1 do
    max_idx = [max_idx, i+nums[i]].max
    i += 1
  end

  return max_idx >= nums.length - 1
end
