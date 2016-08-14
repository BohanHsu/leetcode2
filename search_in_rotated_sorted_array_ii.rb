# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target)
  return search_helper(nums, target, 0, nums.length-1)
end

def search_helper(nums, target, from, to)
  if nums[from] == target || nums[to] == target
    return true
  end

  if from + 1 >= to
    return false
  end
  
  i = (from + to) / 2

  if nums[i] == target
    return true
  end

  result = false

  if nums[from] < nums[i]
    if nums[from] < target && target < nums[i]
      return search_helper(nums, target, from, i)
    else
      return search_helper(nums, target, i, to)
    end
  else
    result |= search_helper(nums, target, from, i)
  end

  if nums[i] < nums[to]
    if nums[i] < target && target < nums[to]
      return search_helper(nums, target, i, to)
    else
      return search_helper(nums, target, from , i)
    end
  else
    result |= search_helper(nums, target, i, to)
  end

  return result
end
