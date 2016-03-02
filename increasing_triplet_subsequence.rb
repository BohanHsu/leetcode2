# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  most_small = Float::INFINITY
  last_small = nil
  i = 0

  while i < nums.length do
    return true if !last_small.nil? && nums[i] > last_small
    if nums[i] < most_small
      if last_small.nil?
        most_small = nums[i] 
        i += 1
      else
        j = i + 1
        return false if j >= nums.length
        while j < nums.length do
          return true if nums[j] > last_small
          if nums[j] == last_small
            i = j + 1
            break
          end
          if nums[j] < last_small && nums[j] > nums[i]
            most_small = nums[i]
            last_small = nums[j]
            i = j + 1
            break
          end

          if nums[j] < nums[i]
            i = j
            break
          end

          j += 1
        end
      end
    elsif nums[i] > most_small
      if last_small.nil?
        last_small = nums[i]
      else
        if nums[i] < last_small
          last_small = nums[i]
        end
      end
      i += 1
    else
      i += 1
    end
  end

  return false
end
