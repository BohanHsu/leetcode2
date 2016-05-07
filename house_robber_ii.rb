# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return 0 if nums.empty?
  return nums[0] if nums.length == 1
  return [
    rob_helper({}, nums[1...nums.length], 0), 
    rob_helper({}, nums[0...(nums.length - 1)], 0)
  ].max
end

def rob_helper(hsh, nums, from)
  #puts "hsh=#{hsh}, nums=#{nums}, from=#{from}"
  return 0 if from >= nums.length
  if hsh.has_key?(from)
    return hsh[from]
  end

  hsh[from] = [
    nums[from] + rob_helper(hsh, nums, from + 2), 
    rob_helper(hsh, nums, from + 1)
  ].max

  return hsh[from]
end
