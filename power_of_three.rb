# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
  return true if n == 1
  return false if n < 1
  while n > 1 do
    if n % 3 != 0
      return false
    end
    n /= 3
  end
  return true
end
