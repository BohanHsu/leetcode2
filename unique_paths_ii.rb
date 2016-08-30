# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  height = obstacle_grid.length
  return 0 if height == 0
  width = obstacle_grid[0].length
  return 0 if width == 0

  buffer = width.times.map do |i|
    1
  end

  buffer.each_with_index do |ele, i|
    if i == 0 
      buffer[i] = (obstacle_grid[0][0] == 1 ? 0 : 1)
    else
      buffer[i] = (obstacle_grid[0][i] == 1 || buffer[i-1] == 0) ? 0 : 1
    end
  end

  (1...height).each do |i|
    buffer[0] = (buffer[0] == 1 && obstacle_grid[i][0] == 0 ? 1 : 0)
    (1...width).each do |j|
      if obstacle_grid[i][j] == 1
        buffer[j] = 0
      else
        buffer[j] = buffer[j] + buffer[j-1]
      end
    end
  end

  return buffer.last
end
