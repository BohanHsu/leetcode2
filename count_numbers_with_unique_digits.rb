# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
  return 1 if n == 0
  return 10 if n == 1
  sum = 10
  if n >= 12
    n = 11
  end
  if n <= 11
    (2..n).each do |i|
      tmp = 9 
      (i - 1).times do |j|
        tmp *= ((9 - j) >= 0 ? (9-j) : 0)
      end
      sum += tmp
    end
  end

  return sum
end
