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

  #count = 0
  #stack = [[t.length, s.length]]

  #while !stack.empty? do
  #  a, b = stack.pop

  #  if a == 0 && b == 0
  #    count += 1
  #    next
  #  end

  #  if matrix[a][b-1] == matrix[a][b] - 1
  #    stack << [a, b-1]
  #  end

  #  if matrix[a-1][b-1] == matrix[a][b] && t[a-1] == s[b-1]
  #    stack << [a-1, b-1]
  #  end
  #end

  #count

  counts = matrix.map do |row|
    row.map do |i|
      0
    end
  end

  counts[t.length][s.length] = 1

  counts.each do |row|
    row.each do |ele|
      print "#{ele}\t"
    end
    puts ""
  end

  puts "====="

  queue = [[t.length, s.length]]

  while !queue.empty? do
    a, b = queue.shift

    cur_count = 0
    if b < s.length
      if matrix[a][b] + 1 == matrix[a][b+1]
        cur_count += counts[a][b+1]
      end

      if a < t.length
        if t[a] == s[b] && matrix[a][b] == matrix[a+1][b+1]
          cur_count += counts[a+1][b+1]
        end
      end
    end

    if !(a == t.length && b == s.length)
      counts[a][b] = cur_count
    end

    if b > 1
      if matrix[a][b-1] == matrix[a][b] - 1
        queue << [a, b-1]
      end

      if a > 1
        if matrix[a-1][b-1] == matrix[a][b] && t[a-1] == s[b-1]
          queue << [a-1, b-1]
        end
      end
    end
  end

  
  counts.each do |row|
    row.each do |ele|
      print "#{ele}\t"
    end
    puts ""
  end


  counts[0][0]
end
