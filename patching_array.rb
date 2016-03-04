# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer}
def min_patches(nums, n)
  if nums.length == 0
    sum = 3
    count = 2
    i = 0
  else
    if nums[0] == 1
      sum = 1
      count = 0
      i = 1
      return count if sum >= n
      if nums.length >=2 && (nums[1] == 1 || nums[1] == 2)
        sum += nums[1]
        i = 2
      end
      return count if sum >= n
    elsif nums[0] == 2
      sum = 3
      count = 1
      i = 1
      return count if sum >= n
    else
      sum = 1
      count = 1
      i = 0
    end
  end

  while i < nums.length do
    if nums[i] <= sum + 1
      sum += nums[i]
      i += 1
    else
      #puts "add1: #{sum+1}"
      sum = sum * 2 + 1
      count += 1
    end
    if sum >= n
      return count
    end
  end

  while sum < n do
    #puts "add2: #{sum+1}"
    sum = sum * 2 + 1
    count += 1
  end

  return count
end
