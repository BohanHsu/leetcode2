# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  carrier = 1
  len = digits.length
  len.times do |i|
    digit = digits[(len - 1 - i)]
    digits[(len - 1 - i)] = (digit + carrier) % 10
    carrier = (digit + carrier) / 10
    break if carrier == 0
  end

  if carrier == 1
    digits = [1] + digits
  end

  return digits
end
