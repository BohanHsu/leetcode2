# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!
  return nil if nums.length < 3
  cur_sum = nums[0] + nums[1] + nums[2]
  i = 0

  while i < nums.length - 2 do
    j = i + 1
    k = nums.length - 1

    while j < nums.length && k > i && j < k do
      if (nums[i] + nums[j] + nums[k] - target).abs < (target - cur_sum).abs
        cur_sum = nums[i] + nums[j] + nums[k]
      end

      if cur_sum == target
        return target
      end

      if nums[i] + nums[j] + nums[k] - target > 0
        k -= 1
      else
        j += 1
      end
    end
    i += 1
  end
  return cur_sum
end
