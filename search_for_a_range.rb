# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  return [-1, -1] if nums.empty?
  start_index = search_start(nums, target)
  return [-1, -1] if start_index == -1
  end_index = search_end(nums, target, start_index)
  return [start_index, end_index]
end

def search_start(nums, target)
  from = 0
  to = nums.length
  i = (from + to) / 2


  while from < to do
    if i == 0 && nums[i] == target || i != 0 && nums[i-1] < target && nums[i] == target
      return i
    elsif i == 0 && nums[i] > target || to == from + 1 && nums[i] != target
      return -1
    elsif i != 0 && nums[i-1] >= target
      # go left
      to = i
      i = (from + to) / 2
    else
      from = i
      i = (from + to) / 2
    end
  end
end

def search_end(nums, target, from)
  to = nums.length
  i = (from + to) / 2

  while from < to do
    if i == nums.length - 1 && nums[i] == target || i != nums.length - 1 && nums[i] == target && nums[i+1] > target
      return i
    elsif i == nums.length - 1 && nums[i] < target || to == from + 1 && nums[i] != target
      return -1
    elsif i != nums.length - 1 && nums[i+1] <= target
      # go right
      from = i
      i = (from + to) / 2
    else
      to = i
      i = (from + to) / 2
    end
  end
end
