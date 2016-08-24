# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  matrix = n.times.map do
    n.times.map do
      0
    end
  end

  height = matrix.length
  return [] if height == 0
  width = matrix[0].length

  si = 0
  sj = 0

  cnt = 1

  while height > 0 && width > 0 do
    if height == 1 && width == 1
      matrix[si][sj] = cnt
      cnt += 1
    elsif height == 1
      (0...(width)).each do |j|
        matrix[si][sj+j] = cnt
        cnt += 1
      end
    elsif width == 1
      (0...(height)).each do |i|
        matrix[si+i][sj+width-1] = cnt
        cnt += 1
      end
    else
      (0...(width-1)).each do |j|
        matrix[si][sj+j] = cnt
        cnt += 1
      end

      (0...(height-1)).each do |i|
        matrix[si+i][sj+width-1] = cnt
        cnt += 1
      end

      (0...(width-1)).each do |j|
        matrix[si+height-1][sj+width-1-j] = cnt
        cnt += 1
      end

      (0...(height-1)).each do |i|
        matrix[si+height-1-i][sj] = cnt
        cnt += 1
      end
    end

    si += 1
    sj += 1
    height -=2
    width -= 2
  end

  return matrix
end
