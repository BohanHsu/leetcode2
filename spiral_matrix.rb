# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  height = matrix.length
  return [] if height == 0
  width = matrix[0].length

  si = 0
  sj = 0

  result = []

  while height > 0 && width > 0 do
    if height == 1 && width == 1
      result << matrix[si][sj]
    elsif height == 1
      (0...(width)).each do |j|
        result << matrix[si][sj+j]
      end
    elsif width == 1
      (0...(height)).each do |i|
        result << matrix[si+i][sj+width-1]
      end
    else
      (0...(width-1)).each do |j|
        result << matrix[si][sj+j]
      end

      (0...(height-1)).each do |i|
        result << matrix[si+i][sj+width-1]
      end

      (0...(width-1)).each do |j|
        result << matrix[si+height-1][sj+width-1-j]
      end

      (0...(height-1)).each do |i|
        result << matrix[si+height-1-i][sj]
      end
    end

    si += 1
    sj += 1
    height -=2
    width -= 2
  end

  return result
end
