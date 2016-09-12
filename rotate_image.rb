# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  (matrix.length/2).times do |i|
    (i...(matrix.length-1-i)).each do |j|
      rotate_helper(matrix, i, j)
    end
  end

end

def rotate_helper(matrix, i, j)
  l = matrix.length
  tmp = matrix[i][j]
  matrix[i][j] = matrix[l-1-j][i]
  matrix[l-1-j][i] = matrix[l-1-i][l-1-j]
  matrix[l-1-i][l-1-j] = matrix[j][l-1-i]
  matrix[j][l-1-i] = tmp
end
