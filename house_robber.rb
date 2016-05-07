# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return rob_helper({}, nums, 0)
end

def rob_helper(hsh, nums, from)
  return 0 if from >= nums.length
  if hsh.has_key?(from)
    return hsh[from]
  end

  hsh[from] = [nums[from] + rob_helper(hsh, nums, from + 2), rob_helper(hsh, nums, from + 1)].max

  return hsh[from]
end
