# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  if matrix.length == 0 || matrix[0].length == 0
    return false
  end

  i = matrix.length - 1
  j = 0

  while matrix[i][j] != target do
    if matrix[i][j] < target
      if j + 1 < matrix[0].length
        j += 1
      else
        return false
      end
    else
      if i - 1 >= 0
        i -= 1
      else
        return false
      end
    end
  end

  return true
end
