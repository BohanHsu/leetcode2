# @param {Integer} n
# @return {Integer}
def count_digit_one(n)
  hsh = {}
  return count_digit_one_helper(n, 0, hsh)
end

def count_digit_one_helper(n, base, hsh)
  return 0 if n < 1
  return 1 if n >= 1 && n <= 9
  base = 1
  while n >= base do
    base *= 10
  end
  base /= 10
  digit = n / base
  remain = n % base

  #puts "n=#{n}, digit=#{digit}, remain=#{remain}, base=#{base}"

  if digit == 1
    #puts "get_from_hash(base, hsh)=#{get_from_hash(base, hsh)}" 
    return count_digit_one_helper(remain, base / 10, hsh) + (remain + 1) + get_from_hash(base, hsh)
  elsif digit > 1
    return count_digit_one_helper(remain, base / 10, hsh) + base + get_from_hash(base, hsh) * digit
  end
end

def get_from_hash(num, hsh)
  return 0 if num == 0
  return 1 if num <= 10

  if hsh.has_key?(num)
    return hsh[num]
  end

  hsh[num] = get_from_hash(num / 10, hsh) * 10 + num / 10
  return hsh[num]
end
