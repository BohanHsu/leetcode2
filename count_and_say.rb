# @param {Integer} n
# @return {String}
def count_and_say(n)
  num = 1
  (n-1).times do |i|
    num = count(num)
  end

  return num.to_s
end

def count(n)
  result = []
  mask = 1
  while mask <= n do
    mask *= 10
  end
  mask /= 10

  cur_digit = -1
  count_occ = 0
  while mask > 0 do
    digit = (n / mask) % 10

    if cur_digit == -1
      cur_digit = digit
      count_occ = 0
    end

    if digit == cur_digit
      count_occ += 1
    else
      result << count_occ
      result << cur_digit

      cur_digit = digit
      count_occ = 1
    end

    mask /= 10
  end

  result << count_occ
  result << cur_digit

  return result.join("").to_i
end
