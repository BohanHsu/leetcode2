# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  i = 0
  j = nums.length

  while i < j do
    if nums[i] == val
      while nums[j-1] == val do
        j -= 1
      end

      if i >= j
        return i
      end

      j -= 1
      swap(nums, i, j)
    end
    i += 1
  end

  return j
end

def swap(nums, i, j)
  tmp = nums[i]
  nums[i] = nums[j]
  nums[j] = tmp
end
