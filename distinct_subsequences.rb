# @param {String} s
# @param {String} t
# @return {Integer}
def num_distinct(s, t)
  if t.length > s.length
    return 0
  end

  matrix = (t.length+1).times.map do |i|
    (s.length+1).times.map do |j|
      0
    end
  end

  matrix[0][0] = 0
  t.length.times do |i|
    matrix[i+1][0] = s.length * 2
  end

  s.length.times do |j|
    matrix[0][j+1] = j+1
  end

  t.length.times do |i|
    s.length.times do |j|
      if s[j] == t[i]
        matrix[i+1][j+1] = [matrix[i][j], matrix[i+1][j] + 1].min
      else
        matrix[i+1][j+1] = matrix[i+1][j] + 1
      end
    end
  end

  #matrix.each do |row|
  #  row.each do |ele|
  #    print "#{ele}\t"
  #  end
  #  puts ""
  #end

  return 0 if matrix[t.length][s.length] >= s.length

  count = 0
  stack = [[t.length, s.length]]

  while !stack.empty? do
    a, b = stack.pop

    if a == 0 && b == 0
      count += 1
      next
    end

    if matrix[a][b-1] == matrix[a][b] - 1
      stack << [a, b-1]
    end

    if matrix[a-1][b-1] == matrix[a][b] && t[a-1] == s[b-1]
      stack << [a-1, b-1]
    end
  end

  count
end
