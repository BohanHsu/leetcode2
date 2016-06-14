# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  from = 0
  to = nums.length
  return nil if nums.length == 0
  return nums[0] if nums.length == 1

  while true do
    i = (from + to) / 2
    if is_minmun(nums, i)
      return nums[i]
    end

    if is_minmun(nums, from)
      return nums[from]
    end

    if nums[from] < nums[i]
      from = i
    elsif nums[from] > nums[i]
      to = i
    end
  end
  nil
end

def is_minmun(nums, i)
  if i == 0
    return nums[nums.length - 1] > nums[0]
  end

  return nums[i] < nums[i-1]
end
