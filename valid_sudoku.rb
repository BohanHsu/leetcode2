# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  9.times do |i|
    row = 0
    column = 0
    9.times do |j|
      if board[i][j] != '.'
        d1 = board[i][j].to_i
        if (row >> d1) & 1 == 1
          return false
        else
          row = row | (1 << d1)
        end
      end

      if board[j][i] != '.'
        d2 = board[j][i].to_i
        if (column >> d2) & 1 == 1
          return false
        else
          column = column | (1 << d2)
        end
      end
    end
  end

  3.times do |i_shift|
    3.times do |j_shift|
      square = 0
      3.times do |i|
        3.times do |j|
          if board[i_shift * 3 + i][j_shift * 3 + j] != '.'
            d = board[i_shift * 3 + i][j_shift * 3 + j].to_i
            if (square >> d & 1) == 1
              return false
            else
              square = square | 1 << d
            end
          end
        end
      end
    end
  end

  return true
end
