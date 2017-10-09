# @param {Integer} n
# @return {Integer}
def integer_break(n)
  num = n
  max = nil
  (2..num).each do |j|
    a = num / j
    b = num % j

    mul = j.times.inject(1) {|m, e| m * a}
    mul = mul / a * (a + b)
    if max.nil? || max < mul
      max = mul
    end

    c = a + 1
    if c * (j - 1) < num
      d = num - c * (j - 1)
      mul = j.times.inject(1) {|m, e| m * c}
      mul = mul / c * d

      if max.nil? || max < mul
        max = mul
      end
    end
  end
  return max
end
