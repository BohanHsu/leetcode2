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
  tmp = max_product_helper(nums, j, i-1)
  cur_max = [cur_max, tmp].max
  cur_max
end

def max_product_helper(nums, f, t)
  if f == t
    return nums[f]
  end

  cur_max = Float::INFINITY

  first_negative_idx = nil

  res = nums[f]

  i = f + 1
  while i <= to do
    if res < 0 && first_negative_idx.nil?
      first_negative_idx = i
    end
    if res > 0
      cur_max = [cur_max, res].max
    else
      if !first_negative_idx.nil? && first_negative_idx != i
        cur_max = [cur_max, res / nums[first_negative_idx]].max
      end
    end

    res *= nums[i]
    i += 1
  end


end
