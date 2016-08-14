# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  i = -1
  j = 0

  while j < nums.length do
    k = nil
    if j + 2 < nums.length && nums[j] == nums[j+2]
      k = j + 2
      while k < nums.length && nums[k] == nums[j] do
        k += 1
      end
      i += 1
      swap(nums, i, j)
      i += 1
      swap(nums, i, j)
      j = k
    else
      k = j + 1
      i += 1
      swap(nums, i, j)
      j = k
    end
  end
  return i + 1
end

def swap(nums, i, j)
  nums[i] = nums[j]
end
