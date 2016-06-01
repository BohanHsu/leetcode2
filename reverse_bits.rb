# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  res = 0
  (0...32).each do |i|
    if ((1 << i) & n) != 0
      res |= (1 << (31 - i))
    end
  end
  res
end
