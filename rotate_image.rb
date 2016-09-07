# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  matrix.each do |row|
    puts "#{row}"
  end
  (matrix.length/2).times do |i|
    (i...(matrix.length-1-i)).each do |j|
      rotate_helper(matrix, i, j)
    end
  end
end

def rotate_helper(matrix, i, j)
  puts "+++++  i=#{i}, j=#{j}"
  length = matrix.length
  tmp = matrix[i][j]
  puts "tmp=#{matrix[i][j]}"
  matrix[i][j] = matrix[length-1-i-j][j]
  puts "matrix[#{i}][#{j}]=matrix[#{length-1-i-j}][#{j}] (#{matrix[length-1-i-j][j]})"
  matrix[length-1-i-j][j] = matrix[length-1-i][length-1-i-j]
  puts "matrix[#{length-1-i-j}][#{j}]=matrix[#{length-1-i}][#{length-1-i-j}] (#{matrix[length-1-i][length-1-i-j]})"
  matrix[length-1-i][length-1-i-j] = matrix[i+j][length-1-i]
  puts "matrix[#{length-1-i}][#{length-1-i-j}]=matrix[#{i+j}][#{length-1-i}] (#{matrix[i+j][length-1-i]})"
  matrix[i+j][length-1-i] = tmp
  puts "matrix[#{i+j}][#{length-1-i}]=#{tmp}"
end

# length
# i, j -> , i + j, length-1-i -> length-1-i, length-1-i-j -> length-1-i-j, j
#0,0 -> 0,1 -> 1,1 -> 0,1
