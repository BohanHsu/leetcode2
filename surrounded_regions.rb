# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  height = board.length
  return if height == 0
  width = board[0].length
  return if width == 0

  height.times do |i|
    bfs(board, i, 0, height, width)
    bfs(board, i, width - 1, height, width)
  end

  width.times do |j|
    bfs(board, 0, j, height, width)
    bfs(board, height - 1, j, height, width)
  end

  height.times do |i|
    width.times do |j|
      if board[i][j] == 'F'
        board[i][j] = 'O'
      else
        board[i][j] = 'X'
      end
    end
  end

  nil
end

def bfs(board, i, j, height, width)
  return if board[i][j] != 'O'

  queue = [[i, j]]

  while !queue.empty? do
    a, b = queue.shift
    board[a][b] = 'F'

    queue << [a, b+1] if in_border?(height, width, a, b+1) && board[a][b+1] == 'O'
    queue << [a, b-1] if in_border?(height, width, a, b-1) && board[a][b-1] == 'O'
    queue << [a+1, b] if in_border?(height, width, a+1, b) && board[a+1][b] == 'O'
    queue << [a-1, b] if in_border?(height, width, a-1, b) && board[a-1][b] == 'O'
  end
end

def at_border?(height, width, i, j)
  return i == 0 || j == 0 || i == height - 1 || j == width - 1
end

def in_border?(height, width, i, j)
  return i >= 0 && i < height && j >= 0 && j < width
end
