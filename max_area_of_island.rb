require 'minitest/autorun'

# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
  max_cnt = 0
  mask = grid.map do |row|
    row.map do
      true
    end
  end

  height = grid.length
  return 0 if height == 0
  width = grid[0].length
  return 0 if width == 0

  height.times do |i|
    width.times do |j|
      if grid[i][j] == 1 && mask[i][j]
        cnt = 0
        queue = [[i, j]]
        mask[i][j] = false
        #puts "i=#{i}, j=#{j}"
        while !queue.empty? do
          ii, jj = queue.shift
          #puts "    ii=#{ii}, jj=#{jj}, queue=#{queue}"
          #mask[ii][jj] = false
          cnt += 1

          if ii > 0 && mask[ii-1][jj] && grid[ii-1][jj] == 1
            queue << [ii-1, jj]
            mask[ii-1][jj] = false
          end

          if ii < height - 1 && mask[ii+1][jj] && grid[ii+1][jj] == 1
            queue << [ii+1, jj]
            mask[ii+1][jj] = false
          end

          if jj > 0 && mask[ii][jj-1] && grid[ii][jj-1] == 1
            queue << [ii, jj-1]
            mask[ii][jj-1] = false
          end

          if jj < width - 1 && mask[ii][jj + 1] && grid[ii][jj + 1] == 1
            queue << [ii, jj+1]
            mask[ii][jj+1] = false
          end
        end

        if cnt > max_cnt
          max_cnt = cnt
        end
        #puts "cnt=#{cnt}, max_cnt=#{max_cnt}"
      end
    end
  end

  return max_cnt
end

describe 'max_area_of_island(grid)' do
  it 'should work1' do
    grid = [
      [0,0,1,0,0,0,0,1,0,0,0,0,0],
      [0,0,0,0,0,0,0,1,1,1,0,0,0],
      [0,1,1,0,1,0,0,0,0,0,0,0,0],
      [0,1,0,0,1,1,0,0,1,0,1,0,0],
      [0,1,0,0,1,1,0,0,1,1,1,0,0],
      [0,0,0,0,0,0,0,0,0,0,1,0,0],
      [0,0,0,0,0,0,0,1,1,1,0,0,0],
      [0,0,0,0,0,0,0,1,1,0,0,0,0]
    ]
    expected_result = 6
    max_area_of_island(grid).must_equal(expected_result)

    grid = [
      [0,0,0,0,0,0,0,0,0,0,0,0,0]
    ]
    expected_result = 0
    max_area_of_island(grid).must_equal(expected_result)
  end
end
