# @param {Integer} n
# @return {String[][]}
def solve_n_queens(n)
  results = []

  stack = n.times.map do |i|
    board = ["." * n]
    board[0][i] = "Q"
    board
  end

  while !stack.empty? do
    cur_board = stack.pop
    if cur_board.length == n
      results << cur_board
    else
      n.times do |j|
        if is_safe(cur_board, j)
          new_board = cur_board.clone
          new_row = "." * n
          new_row[j] = "Q"
          new_board << new_row
          stack << new_board
        end
      end
    end
  end

  return results
end

def is_safe(part_board, j)
  i = part_board.length
  (1..i).each do |k|
    if part_board[i-k][j] == "Q"
      return false
    end
    if j - k >= 0 && part_board[i-k][j-k] == "Q"
      return false
    end
    if j + k < part_board[0].length && part_board[i-k][j+k] == "Q"
      return false
    end
  end

  return true
end
