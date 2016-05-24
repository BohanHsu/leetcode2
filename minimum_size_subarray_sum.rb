# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  sums = nums.map do |n|
    0
  end

  min_j = -1
  min_i = nums.length + 1
  j = 0

  nums.each_with_index do |n, idx|
    if idx == 0
      sums[idx] = n
    else
      sums[idx] = sums[idx-1] + n
    end


    if j == 0
      sums_j = 0
    else
      sums_j = sums[j-1]
    end

    cur_diff = sums[idx] - sums_j
    while cur_diff - nums[j] >= s do
      cur_diff -= nums[j]
      j += 1
    end

    if cur_diff >= s
      if idx - j < min_i - min_j
        min_i = idx
        min_j = j
      end
    end
  end

  return 0 if min_i == nums.length + 1 && min_j == -1
  return min_i - min_j + 1
end
