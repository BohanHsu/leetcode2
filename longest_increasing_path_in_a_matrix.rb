# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
  return 0 if matrix.length == 0
  return 0 if matrix.first.length == 0

  height = matrix.length
  width = matrix.first.length
  max = -1

  path_length = matrix.map do |row|
    row.map do
      0
    end
  end

  queue = find_start_position(matrix, path_length)
    
  while !queue.empty? do
    pos = queue.shift
    i = pos[0]
    j = pos[1]

    if path_length[i][j] > max
      max = path_length[i][j]
    end


    if i - 1 >= 0 && matrix[i-1][j] > matrix[i][j]
      if path_length[i-1][j] < path_length[i][j] + 1
        path_length[i-1][j] = path_length[i][j] + 1
        queue << [i-1, j]
      end
    end
    if i + 1 < height && matrix[i+1][j] > matrix[i][j]
      if path_length[i+1][j] < path_length[i][j] + 1
        path_length[i+1][j] = path_length[i][j] + 1
        queue << [i+1, j]
      end
    end
    if j - 1 >= 0 && matrix[i][j-1] > matrix[i][j]
      if path_length[i][j-1] < path_length[i][j] + 1
        path_length[i][j-1] = path_length[i][j] + 1
        queue << [i, j-1]
      end
    end
    if j + 1< width && matrix[i][j+1] > matrix[i][j]
      if path_length[i][j+1] < path_length[i][j] + 1
        path_length[i][j+1] = path_length[i][j] + 1
        queue << [i, j+1]
      end
    end
  end
  max
end

def find_start_position(matrix, path_length)
  height = matrix.length
  width = matrix.first.length

  queue = []
  height.times do |i|
    width.times do |j|
      if start_position?(matrix, i, j)
        path_length[i][j] = 1
        queue << [i, j] 
      end
    end
  end


  return queue
end

def start_position?(matrix, i, j)
  height = matrix.length
  width = matrix.first.length
  if i - 1 >= 0 && matrix[i-1][j] < matrix[i][j]
    return false
  end
  if i + 1 < height && matrix[i+1][j] < matrix[i][j]
    return false
  end
  if j - 1 >= 0 && matrix[i][j-1] < matrix[i][j]
    return false
  end
  if j + 1< width && matrix[i][j+1] < matrix[i][j]
    return false
  end
  return true
end
