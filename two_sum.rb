# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  indices = nums.length.times.map {|i| i}
  indices.sort! do |x, y| 
    nums[x] - nums[y]
  end

  i = 0
  j = indices.length - 1
  while i < j && nums[indices[i]] + nums[indices[j]] != target do
    if nums[indices[i]] + nums[indices[j]] < target
      i += 1
    else
      j -= 1
    end
  end
  if i >= j
    return nil
  else
    return [indices[i], indices[j]].sort
  end
end
