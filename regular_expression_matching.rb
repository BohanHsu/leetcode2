# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  pattern = []
  star = []

  p.chars.each_with_index do |chr, idx|
    if chr == "*"
      star[star.length - 1] = true
    else
      pattern << chr
      star << false
    end
  end

  p = pattern

  matrix = (p.length + 1).times.map do |i|
    (s.length + 1).times.map do |j|
      0
    end
  end

  s.length.times do |i|
    matrix[0][i+1] = i + 1
  end

  p.length.times do |j|
    matrix[j+1][0] = ((matrix[j][0] == 0 && star[j]) ? 0 : matrix[j][0] + 1)
  end

  p.length.times do |i|
    s.length.times do |j|
      arr = []
      match = p[i] == "." || p[i] == s[j]
      if star[i]
        arr << matrix[i][j+1]
        arr << (matrix[i+1][j] + (match ? 0 : 1))
      end
      arr << (matrix[i][j] + (match ? 0 : 1))
      matrix[i+1][j+1] = arr.min
    end
  end

  return matrix[p.length][s.length] == 0
end
