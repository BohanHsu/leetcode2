# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  len = nums.length
  i = len - 1
  while i > 0 && nums[i-1] >= nums[i] do
    i -= 1
  end
  i -= 1


  if i != -1
    j = -1
    ((i+1)...len).each do |k|
      if j == -1 && nums[k] > nums[i]
        j = k
      end

      if j != -1 && nums[k] > nums[i] && nums[k] <= nums[j]
        j = k
      end
    end

    swap(nums, i, j)
  else
    #i -= 1
  end

  i += 1
  j = len - 1
  while i < j do
    swap(nums, i, j)
    i += 1
    j -= 1
  end

  return
end

def swap(nums, i, j)
  tmp = nums[i]
  nums[i] = nums[j]
  nums[j] = tmp
end
