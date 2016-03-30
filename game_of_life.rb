# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
  height = board.length
  return board if height == 0
  width = board.first.length
  return board if width == 0


  height.times do |i|
    width.times do |j|
      if board[i][j] > 0
        board[i][j] = count_neighboors(board, i, j) + 1
      else
        board[i][j] = -count_neighboors(board, i, j)
      end
    end
  end

  height.times do |i|
    width.times do |j|
      if board[i][j] > 0
        board[i][j] -= 1
        if board[i][j] < 2 || board[i][j] > 3
          board[i][j] = 0
        else
          board[i][j] = 1
        end
      else
        if board[i][j] == -3
          board[i][j] = 1
        else
          board[i][j] = 0
        end
      end
    end
  end

  board
end

def count_neighboors(board, i, j)
  height = board.length
  width = board.first.length
  live_neighboors = 0

  if i - 1 >= 0
    if j - 1 >= 0
      live_neighboors += 1 if board[i-1][j-1] > 0
    end
    live_neighboors += 1 if board[i-1][j] > 0
    if j + 1 < width
      live_neighboors += 1 if board[i-1][j+1] > 0
    end
  end

  if i + 1 < height
    if j - 1 >= 0
      live_neighboors += 1 if board[i+1][j-1] > 0
    end
    live_neighboors += 1 if board[i+1][j] > 0
    if j + 1 < width
      live_neighboors += 1 if board[i+1][j+1] > 0
    end
  end

  if j - 1 >= 0
    live_neighboors += 1 if board[i][j-1] > 0
  end

  if j + 1 < width
    live_neighboors += 1 if board[i][j+1] > 0
  end

  live_neighboors
end
