# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  count = 0
  while n != 0 do
    n &= ~(n & ~(n-1))
    count += 1
  end
  count
end
