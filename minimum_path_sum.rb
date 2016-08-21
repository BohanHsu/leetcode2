# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  height = grid.length
  width = grid[0].length

  (1...height).each do |i|
    grid[i][0] = grid[i-1][0] + grid[i][0]
  end

  (1...width).each do |j|
    grid[0][j] = grid[0][j-1] + grid[0][j]
  end

  (1...height).each do |i|
    (1...width).each do |j|
      grid[i][j] = [grid[i-1][j], grid[i][j-1]].min + grid[i][j]
    end
  end

  return grid[height-1][width-1]
end
