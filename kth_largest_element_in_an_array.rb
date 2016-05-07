# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def find_kth_largest(nums, k)
  k = nums.length - k + 1
  from = 0
  to = nums.length
  return find_kth_largest_helper(nums, k, from, to)
end

def find_kth_largest_helper(nums, k, from, to)
  i = rand(to - from) + from
  swap(nums, i, from)
  j = from + 1
  i = from
  while j < to do
    
    if nums[j] < nums[from]
      swap(nums, i+1, j)
      i += 1
    end
    j += 1
  end

  swap(nums, i, from)
  if i == k - 1
    return nums[i]
  end
  if i > k - 1
    return find_kth_largest_helper(nums, k, from, i)
  end

  if i < k - 1
    return find_kth_largest_helper(nums, k, i + 1, to)
  end
end

def swap(nums, i, j)
  tmp = nums[i]
  nums[i] = nums[j]
  nums[j] = tmp
end
