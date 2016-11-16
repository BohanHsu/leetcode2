# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0

  left_mask = 10
  while left_mask <= x do
    left_mask *= 10
  end
  left_mask /= 10
  right_mask = 10

  while left_mask >= right_mask do
    left_digit = (x / left_mask) % 10
    right_digit = (x % right_mask) / (right_mask / 10)
    return false if left_digit != right_digit
    left_mask /= 10
    right_mask *= 10
  end

  return true
end
