# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  j = 0
  i = 0
  cur_max = -Float::INFINITY
  while i < nums.length do
    if nums[i] != 0
      i += 1
    else
      tmp = max_product_helper(nums, j, i-1)
      cur_max = [0, cur_max, tmp].max
      j = i + 1
      i += 1
    end
  end
  if i >= j
    tmp = max_product_helper(nums, j, i-1)
    cur_max = [cur_max, tmp].max
  end
  cur_max
end

def max_product_helper(nums, f, t)
  if f == t
    return nums[f]
  end

  cur_max = -Float::INFINITY

  first_negative = nil

  res = 1

  i = f
  while i <= t do
    res *= nums[i]
    i += 1

    if res > 0
      cur_max = [cur_max, res].max
    else
      if first_negative.nil?
        first_negative = res
      else
        cur_max = [cur_max, res / first_negative].max
      end
    end

  end
  cur_max
end
