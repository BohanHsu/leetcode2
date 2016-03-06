# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
  return 0 if matrix.length == 0
  return 0 if matrix.first.length == 0

  height = matrix.length
  width = matrix[0].length
  max = -1

  path_length = matrix.map do |row|
    row.map do
      nil
    end
  end

  height.times do |i|
    width.times do |j|
      dfs(matrix, path_length, i, j)
      max = [max, path_length[i][j]].max
    end
  end

  max
end

def dfs(matrix, path_length, i, j)
  if path_length[i][j].nil?
    max_neighboor = neighboors(matrix, i, j).select do |pos|
      matrix[pos[0]][pos[1]] > matrix[i][j]
    end.map do |pos|
      dfs(matrix, path_length, pos[0], pos[1])
    end.max
    path_length[i][j] = max_neighboor.nil? ? 1 : max_neighboor + 1
  end
  return path_length[i][j]
end

def neighboors(matrix, i, j)
  height = matrix.length
  width = matrix[0].length
  result = []

  result << [i-1, j] if i - 1 >= 0
  result << [i+1, j] if i + 1 < height
  result << [i, j - 1] if j - 1 >= 0
  result << [i, j + 1] if j + 1 < width
  result
end
