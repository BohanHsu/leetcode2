# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  nums.sort!
  result = []
  hsh = {}

  #puts "nums=#{nums}"

  i = 0
  while i < nums.length do 
    if nums[i] * 4 > target
      #puts "shabi1 nums[i]=#{nums[i]}"
    else

      j = i + 3
      while j < nums.length do
        if nums[i] * 3 + nums[j] > target || nums[i] + nums[j] * 3 < target
          #puts "shabi2 nums[i]=#{nums[i]}, nums[j]=#{nums[j]}"
        else

          k = i + 1
          m = j - 1
          while k < m do
            sum = nums[i] + nums[k] + nums[m] + nums[j]
            #puts "nums[i]=#{nums[i]}, nums[k]=#{nums[k]}, nums[m]=#{nums[m]}, nums[j]=#{nums[j]}"
            if sum == target
              insert_result(result, hsh, [nums[i], nums[k], nums[m], nums[j]])
              k += 1
              m -= 1
            elsif sum < target
              k += 1
            else
              m -= 1
            end
          end
        end
        j += 1
      end
    end
    i += 1
  end
  return result
end

def insert_result(result, hsh, arr)
  arr.sort!
  key = arr.join(" ")
  if !hsh.has_key?(key)
    hsh[key] = true
    result << arr
  end
end
