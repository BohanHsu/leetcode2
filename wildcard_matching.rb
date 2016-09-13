# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  #puts "s=#{s}, p=#{p}"
  matrix = (p.length+1).times.map do
    (s.length+1).times.map do
      nil
    end
  end

  matrix[0][0] = 0
  s.length.times do |j|
    matrix[0][j+1] = j + 1
  end

  p.length.times do |i|
    if p[i] == "*"
      matrix[i+1][0] = matrix[i][0]
      #s.length.times do |j|
      #  matrix[i+1][j+1] = matrix[i][0]
      #end
    else
      matrix[i+1][0] = matrix[i][0] + 1
    end
  end

  p.length.times do |i|
    s.length.times do |j|
      #puts "i=#{i+1}, j=#{j+1}"
      if p[i] == "*"
        set_matrix(matrix, i, j, [matrix[i][j], matrix[i][j+1], matrix[i+1][j]].min)
      elsif p[i] == "?" || p[i] == s[j]
        set_matrix(matrix, i, j, matrix[i][j])
      else
        set_matrix(matrix, i, j, matrix[i][j] + 1)
      end
    end
  end
  #matrix.each do |row|
  #  puts "#{row}"
  #end
  return matrix[p.length][s.length] == 0
end

def set_matrix(matrix, i, j, value)
  #puts "set matrix[#{i+1}][#{j+1}]=#{value}"
  #return if matrix[i+1][j+1] == 0
  matrix[i+1][j+1] = value
end
