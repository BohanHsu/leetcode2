# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  counter = 2
  height = grid.length
  return 0 if height == 0
  width = grid[0].length
  return 0 if width == 0

  height.times do |i|
    width.times do |j|
      if is_land(grid, i, j)
        mark_lands(grid, counter, i, j)
        counter += 1
      end
    end
  end
  return counter - 2
end

def mark_lands(grid, counter, i, j)
  queue = [[i, j]]
  grid[i][j] = counter.to_s
  while !queue.empty? do
    pi, pj = queue.shift
    [[pi,pj-1], [pi, pj+1], [pi-1, pj], [pi+1, pj]].each do |position|
      ni, nj = position
      if is_land(grid, ni, nj)
        grid[ni][nj] = counter.to_s
        queue << [ni, nj]
      end
    end
  end
end

def is_water(grid, i, j)
  return true if i < 0 || i >= grid.length
  return true if j < 0 || j >= grid[0].length
  return grid[i][j] == '0'
end

def is_land(grid, i, j)
  return false if is_water(grid, i, j)
  return grid[i][j] == '1'
end
