# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer}
def min_patches(nums, n)
  if nums.length == 0
  end

  count = 0
  sum = 0
  base = 1
  while base * 2 < nums[0] do
    puts "add: #{base}"
    count += 1
    sum += base
    base *= 2
  end

  i = 0
  while sum < n do
    if nums[i] < sum * 2 + 1
      sum += nums[i]
      i += 1
    else
      sum = sum * 2 + 1
      puts "add: #{sum}"
      count += 1
    end
  end
  return count
end
