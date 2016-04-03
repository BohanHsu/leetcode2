# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  s = nums[0]
  f = nums[s]

  while s != f do
    s = nums[s]
    f = nums[nums[f]]
  end

  f = 0

  while f != s do
    s = nums[s]
    f = nums[f]
  end
  
  return s
end
