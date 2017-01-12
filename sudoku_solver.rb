# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  queue = [[board, 0, -1]]
  while !queue.empty? do
    b, i, j = queue.pop
    successors = generate_all_successor(b, i, j)

    if successors.nil?
      9.times do |i|
        9.times do |j|
          board[i][j] = b[i][j]
        end
      end
      return
    end

    queue = queue + successors
  end

  return -1
end

def generate_all_successor(board, last_i, last_j)
  mask = 0
  coord = find_first_empty_from(board, last_i, last_j)
  return nil if coord.nil?

  i, j = coord

  9.times do |k|
    if board[i][k] != '.'
      d = board[i][k].to_i
      mask = mask | (1 << d)
    end

    if board[k][j] != '.'
      d = board[k][j].to_i
      mask = mask | (1 << d)
    end
  end

  i_base = (i / 3) * 3
  j_base = (j / 3) * 3
  3.times do |i_shift|
    3.times do |j_shift|
      val = board[i_base + i_shift][j_base + j_shift]
      if val != '.'
        d = val.to_i
        mask = mask | (1 << d)
      end
    end
  end

  valid_values = (1..9).each.select do |k|
    (mask >> k) & 1 == 0
  end

  successors = []
  valid_values.each do |value|
    new_board = clone_board(board)
    new_board[i][j] = value.to_s
    successors << [new_board, i, j]
  end

  return successors
end

def find_first_empty_from(board, fi, fj)
  ((fj+1)...9).each do |j|
    if board[fi][j] == '.'
      return [fi, j]
    end
  end

  ((fi+1)...9).each do |i|
    9.times do |j|
      if board[i][j] == '.'
        return [i, j]
      end
    end
  end

  return nil
end

def clone_board(board)
  return board.map do |row|
    Array.new row
  end
end
