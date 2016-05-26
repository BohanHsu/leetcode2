# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def range_bitwise_and(m, n)
  range_bitwise_and_helper(m, n)
end

def range_bitwise_and_helper(m, n)
  return 0 if m == 0 || n == 0
  left_most_m = left_most_bit(m)
  left_most_n = left_most_bit(n)
  if left_most_m != left_most_n
    return 0
  else
    return 2 ** (left_most_m - 1 )+ range_bitwise_and_helper(m - 2 ** (left_most_m - 1), n - 2 ** (left_most_n - 1))
  end
end

# return {Integer}
def left_most_bit(n)
  return 0 if n == 0
  mask = 2 ** 30
  res = 31
  while mask & n == 0 do
    res -= 1
    mask /= 2
  end

  return res
end
