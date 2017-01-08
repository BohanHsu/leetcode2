# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  return 0 if nums.empty? || nums[0] >= target
  return nums.length if target > nums[-1]

  from = 0
  to = nums.length
  i = (from + to) / 2

  while from < to do
    #if from + 1 == to && (i == 0 || nums[i] < target&& || i != 0 && target <= nums[i-1])
    if nums[i] == target || i != 0 && nums[i-1] < target && nums[i] > target
      return i
    elsif nums[i] < target
      from = i
      i = (from + to) / 2
    else
      to = i
      i = (from + to) / 2
    end
  end

  return -1
end
