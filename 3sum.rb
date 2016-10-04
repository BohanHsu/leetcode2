# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  result = {}
  nums.sort!
  hsh = {}
  nums.each_with_index do |num, i|
    if !hsh.has_key?(num)
      hsh[num] = []
    end
    hsh[num] << i
  end

  j = nums.length - 1
  while j >= 0 && nums[j] >= 0 do
    i = 0
    while i < nums.length && nums[i] <= 0 do
      diff = 0 - nums[i] - nums[j]
      if diff.abs <= nums[i].abs && diff.abs <= nums[j].abs
        if diff == 0 && nums[i] == 0 && nums[j] == 0
          if hsh.has_key?(0) && hsh[0].length >= 3
            arr = [0,0,0]
            result[a_to_s(arr)] = arr
          end
        elsif diff == nums[i]
          if hsh.has_key?(nums[i]) && hsh[nums[i]].length >= 2
            arr = [nums[i],nums[i],nums[j]]
            result[a_to_s(arr)] = arr
          end
        elsif diff == nums[j]
          if hsh.has_key?(nums[j]) && hsh[nums[j]].length >= 2
            arr = [nums[i],nums[j],nums[j]]
            result[a_to_s(arr)] = arr
          end
        else
          if hsh.has_key?(diff) && hsh[diff].length >= 1
            arr = [nums[i],diff,nums[j]]
            result[a_to_s(arr)] = arr
          end
        end
      end
      i += 1
    end
    j -= 1
  end
  return result.values
end

def a_to_s(arr)
  return arr.join(',')
end
