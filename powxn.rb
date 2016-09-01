# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  if n < 0
    return 1.0 / my_pow_helper(x, -n)
  else
    return my_pow_helper(x, n)
  end
end

def my_pow_helper(x, n)
  return 1 if n == 0
  return x if x == 0 || x == 1
  if n == 1
    return x
  elsif n == 2
    return x * x
  end

  half_n_result = my_pow_helper(x, n/2)
  return half_n_result * half_n_result * (n % 2 == 0 ? 1 : x)
end
