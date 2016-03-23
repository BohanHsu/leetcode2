class NumMatrix

  # Initialize your data structure here.
  # @param {Integer[][]} matrix
  def initialize(matrix)
    height = matrix.length
    if matrix[0].nil? || matrix[0].empty?
      @no_data = true
      return
    end
    width = matrix[0].length

    @no_data = false

    sum = matrix.map do |row|
      row.map do
        0
      end
    end

    matrix.each_with_index do |row, i|
      row.each_with_index do |ele, j|
        sum[i][j] = ele + (j == 0 ? 0 : sum[i][j-1])
      end
    end

    (1...height).each do |i|
      width.times do |j|
        sum[i][j] = sum[i][j] + sum[i-1][j]
      end
    end

    @sum = sum
  end

  def get_sum(row, col)
    return 0 if row < 0 || col < 0
    return @sum[row][col]
  end

  # @param {Integer} row1
  # @param {Integer} col1
  # @param {Integer} row2
  # @param {Integer} col2
  # @return {Integer}
  def sum_region(row1, col1, row2, col2)
    return 0 if @no_data
    return get_sum(row2, col2) + get_sum(row1 - 1, col1 - 1) - get_sum(row1 - 1, col2) - get_sum(row2, col1 - 1)
  end
end

# Your NumMatrix object will be instantiated and called as such:
# num_matrix = NumMatrix.new(matrix)
# num_matrix.sum_region(0, 1, 2, 3)
# num_matrix.sum_region(1, 2, 3, 4)
