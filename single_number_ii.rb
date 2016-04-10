# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  res = 0

  32.times do |i|
    res |= (nums.select do |num|
      (1 << i) & num != 0
    end.length % 3) << i
  end

  if 1 << 31 & res != 0
    res &= ~(1 << 31)
    return res - (2 ** 31)
  else
    return res
  end
end
