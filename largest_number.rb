# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  nums = nums.map {|num| num.to_s}
  nums = nums.sort {|a, b| compare(a, b)}
  nums.join("").to_i.to_s
end

# @param {String} a
# @param {String} b
def compare(a, b)
  i = 0
  while i < lcm(a.length, b.length) do
    a_digit = a[i%a.length]
    b_digit = b[i%b.length]

    if a_digit.ord > b_digit.ord
      return -1
    elsif a_digit.ord < b_digit.ord
      return 1
    end
    i += 1
  end
  0
end

def lcm(a,b)
  return a * b / gcd(a, b)
end

def gcd(a,b)
  smaller = a <= b ? a : b

  gcd = smaller

  while smaller >= 1 do
    if a % gcd == 0 && b % gcd == 0
      return gcd
    end
    gcd -= 1
  end
  1
end
