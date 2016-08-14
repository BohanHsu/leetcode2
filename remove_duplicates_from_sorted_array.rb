# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  i = -1
  j = 0

  while j < nums.length do
    k = j + 1
    if j + 1 < nums.length && nums[j] == nums[j+1]
      while k < nums.length && nums[k] == nums[j] do
        k += 1
      end
    end

    i += 1
    swap(nums, i, j)
    j = k
  end
  return i + 1
end

def swap(nums, i, j)
  tmp = nums[i]
  nums[i] = nums[j]
  nums[j] = tmp
end
