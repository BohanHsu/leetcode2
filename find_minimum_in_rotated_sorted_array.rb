# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  from = 0
  to = nums.length

  while true do
    i = (from + to) / 2
    if is_minmun(nums, i)
      return i
    end
  end
end

def is_minmun(nums, i)
  if i == 0
    return nums[nums.length - 1] > nums[0]
  end

  return nums.length
end
