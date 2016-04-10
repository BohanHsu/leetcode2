# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  return nums.inject do |memo, obj|
    memo ^ obj
  end
end
