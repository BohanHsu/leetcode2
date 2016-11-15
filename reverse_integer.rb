# @param {Integer} x
# @return {Integer}
def reverse(x)
  limit = 2 ** 31 - 1
  is_negative = x < 0
  if is_negative
    x = -x
    limit + 1
  end
  result = 0
  while x > 0 do
    digit = x % 10
    x /= 10
    result = result * 10 + digit
    if result > limit
      return 0
    end
  end

  return is_negative ? -result : result
end
