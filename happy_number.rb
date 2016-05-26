# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  hsh = {}
  while n != 1 do
    return false if hsh.has_key?(n)
    hsh[n] = true
    n = sum_of_digits_square(n)
  end
  return true
end

def sum_of_digits_square(n)
  (n.to_s.chars.map do |chr|
    (chr.ord - '0'.ord) ** 2
  end).inject(0, &:+)
end
