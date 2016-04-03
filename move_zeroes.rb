# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  i = 0
  j = 1

  while i < nums.length && j < nums.length do
    return if i >= nums.length
    if nums[i] == 0
      if j <= i
        j = i + 1
      end

      return if j >= nums.length
      while j < nums.length && nums[j] == 0 do
        j += 1
        return if j >= nums.length
      end

      nums[i] = nums[j]
      nums[j] = 0
    end
    i += 1
  end
end
