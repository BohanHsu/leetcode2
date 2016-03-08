# @param {Integer[]} nums
# # @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
  i = 0
  j = nil

  while i < nums.length - 1 do
    if nums[i] < nums[i+1]
      if i.odd?
        swap(nums, i, i+1)
        i += 1
      else
        i += 1
      end
    elsif nums[i] > nums[i+1]
      if i.odd?
        i += 1
      else
        swap(nums, i, i+1)
        i += 1
      end
    else
      j = i + 2
      while j < nums.length && nums[j] == nums[i] do
        j += 1
      end
      if j == nums.length
        k = 0
        while k < i do
          if valid_to_swap(nums, k, i + 1)
            swap(nums, k, i + 1)
            break
          end
          k += 1
        end
      else
        swap(nums, j, i+1)
        j += 1
      end
    end
    #puts "i=#{i}, j=#{j}, nums=#{nums}"
  end
end

def swap(nums, i, j)
  tmp = nums[i]
  nums[i] = nums[j]
  nums[j] = tmp
end

def valid_to_swap(nums, i, j)
  if i.odd? && nums[i] != nums[j]
    return nums[j] > nums[i-1] && nums[j] > nums[i+1]
  end
  if i.even? && nums[i] != nums[j]
    if i == 0
      return nums[j] < nums[i+1]
    else
      return nums[j] < nums[i+1] && nums[j] < nums[i-1]
    end
  end
  false
end
