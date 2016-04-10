# @param {Integer[]} nums
#@return {Integer[]}
def single_number(nums)
  n = nums.inject(0) do |memo, obj|
    memo ^ obj
  end

  diff_bit = n - (n & (n-1))

  num1 = 0
  num2 = 0

  nums.each do |i|
    if (diff_bit & i) == 0
      num1 ^= i
    else
      num2 ^= i
    end
  end

  return [num1, num2]
end
