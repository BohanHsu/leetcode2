# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  zeros = 0
  while n > 0 do
    zeros  += n / 5
    n /= 5
  end
  return zeros
end
