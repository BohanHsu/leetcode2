# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k = k % nums.length
  buffer = k.times.map do |i|
    nums[nums.length - k + i]
  end

  (nums.length - k).times do |i|
    nums[nums.length - 1 - i] = nums[nums.length - 1 - i - k]
  end

  k.times do |i|
    nums[i] = buffer[i]
  end

  nil
end
