# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  return true if word == ""

  height = board.length
  return false if height == 0
  width = board[0].length

  height.times do |i|
    width.times do |j|
      return true if word[0] == board[i][j] && search_from(board, word, i, j)
    end
  end

  return false
end

def search_from(board, word, arg_i, arg_j)
  searched = board.map do |row|
    row.map do
      false
    end
  end

  stack = [[arg_i, arg_j, 0]]

  while !stack.empty? do
    i, j, idx = stack.last

    if idx == word.length - 1
      return true
    end

    if searched[i][j]
      searched[i][j] = false
      stack.pop
      next
    else
      searched[i][j] = true
    end

    neighboors = get_neighboors(i, j, board)
    stack += neighboors.select do |ni, nj|
      !searched[ni][nj] && word[idx+1] == board[ni][nj]
    end.map do |ni, nj|
      [ni, nj, idx + 1]
    end
  end
  return false
end

def get_neighboors(i, j, board)
  height = board.length
  width = board[0].length

  neighboors = []
  
  neighboors << [i - 1, j] if i > 0
  neighboors << [i + 1, j] if i + 1 < height
  neighboors << [i, j - 1] if j > 0
  neighboors << [i, j + 1] if j + 1 < width

  neighboors
end
