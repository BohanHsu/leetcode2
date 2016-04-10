# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  return (nums.length + 1) * nums.length / 2 - nums.inject(0) do |memo, obj|
    memo + obj
  end
end
