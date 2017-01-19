# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  shuffle_nums nums

  nums.each_with_index do |e, i|
    if e <= 0
      return i + 1
    end
  end

  return nums.length + 1
end

def shuffle_nums(nums)
  nums.each_with_index do |e, i|
    if e > 0
      if e != i + 1
        j = e
        nums[i] = 0
        while j - 1 < nums.length && nums[j-1] != j do
          k = nums[j-1]
          nums[j-1] = j
          if k > 0
            j = k
          end
        end
      end
    end
  end
end
