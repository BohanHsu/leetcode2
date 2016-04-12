# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  if matrix.length == 0 || matrix[0].length == 0
    return false
  end

  from = 0
  to = matrix.length
  mid = (from + to) / 2

  while !check_row(matrix, target, mid) do
    if from == to
      return false
    end
    if matrix[mid][0] > target
      to = mid
    else
      from = mid
    end
    mid = (from + to) / 2
  end

  row = mid
  from = 0
  to = matrix[row].length
  mid = (from + to) / 2

  while matrix[row][mid] != target do
    if from == to || from + 1 == to
      return false
    end
    if matrix[row][mid] < target
      from = mid
    else
      to = mid
    end
    mid = (from + to) / 2
  end

  return true
end

def check_row(matrix, target, i)
  matrix[i][0] <= target && (matrix.length - 1 == i || matrix[i+1][0] > target)
end
