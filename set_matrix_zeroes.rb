# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  row_idx = nil
  col_idx = nil

  matrix.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      if ele == 0 && row_idx.nil? && col_idx.nil?
        row_idx = i
        col_idx = j
      end

      if ele == 0
        matrix[i][col_idx] = 0
        matrix[row_idx][j] = 0
      end
    end
  end

  height = matrix.length
  width = matrix[0].length

  if !row_idx.nil? && !col_idx.nil?
    height.times do |i|
      if i != row_idx && matrix[i][col_idx] == 0
        width.times do |j|
          matrix[i][j] = 0
        end
      end
    end

    width.times do |j|
      if matrix[row_idx][j] == 0
        height.times do |i|
          matrix[i][j] = 0
        end
      end
    end

    width.times do |j|
      matrix[row_idx][j] = 0
    end
  end
end
