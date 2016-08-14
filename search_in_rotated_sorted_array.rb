# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  idx = search_helper(nums, target, 0, nums.length-1)
  return (idx.nil? ? -1 : idx)
end

def search_helper(nums, target, from, to)
  if nums[from] == target
    return from
  end

  if nums[to] == target
    return to
  end

  if from + 1 == to
    return nil
  end
  
  i = (from + to) / 2

  if nums[i] == target
    return i
  end

  if nums[from] < nums[i]
    if nums[from] < target && target < nums[i]
      return search_helper(nums, target, from, i)
    else
      return search_helper(nums, target, i, to)
    end
  end

  if nums[i] < nums[to]
    if nums[i] < target && target < nums[to]
      return search_helper(nums, target, i, to)
    else
      return search_helper(nums, target, from , i)
    end
  end

  return nil
end
