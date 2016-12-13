# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  max_int = (2 ** 31) - 1
  min_int = -(2 ** 31)

  return max_int if divisor == 0
  sign = true

  if dividend < 0
    sign = !sign 
    dividend = -dividend
  end

  if divisor < 0
    sign = !sign
    divisor = -divisor
  end

  sum = 0

  while dividend >= divisor do
    n = divisor
    m = 1
    while n <= dividend do
      n *= 2
      m *= 2
    end
    n /= 2
    m /= 2

    dividend -= n
    sum += m
  end

  result = 0
  if sign
    result = sum
  else
    if dividend == 0
      result = -sum
    else
      # NOTE: that is realy weird, if compare with i/j in ruby, then uncomment 47,
      # if test on leetcode, then comment 47
      result = -sum
      #result = -sum-1
    end
  end

  if result > max_int || result < min_int
    return max_int
  else
    return result
  end
end
