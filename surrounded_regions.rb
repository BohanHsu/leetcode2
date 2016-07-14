# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  #'X', 'O'
  #'V' == visited
  #'S' == surround
  #'B' == free
  
  height = board.length
  return if height == 0
  width = board[0].length
  return if width == 0

  height.times do |i|
    width.times do |j|
      #puts "i=#{i}, j=#{j}"
      if board[i][j] == 'O'
        surround = true
        path = []
        queue = [[i, j]]

        while !queue.empty? do
          a, b = queue.shift
          #puts "  a=#{a}, b=#{b}"
          board[a][b] = 'V'
          path << [a, b]
          if at_border?(height, width, a, b)
            surround = false
          end

          queue << [a, b+1] if in_border?(height, width, a, b+1) && board[a][b+1] == 'O'
          queue << [a, b-1] if in_border?(height, width, a, b-1) && board[a][b-1] == 'O'
          queue << [a+1, b] if in_border?(height, width, a+1, b) && board[a+1][b] == 'O'
          queue << [a-1, b] if in_border?(height, width, a-1, b) && board[a-1][b] == 'O'
        end

        if surround
          chr = 'S'
        else
          chr = 'B'
        end

        path.each do |pair|
          a, b = pair
          board[a][b] = chr
        end
      end
    end
  end

  height.times do |i|
    width.times do |j|
      if board[i][j] == 'S'
        board[i][j] = 'X'
      elsif board[i][j] == 'B'
        board[i][j] = 'O'
      end
    end
  end

  nil
end

def at_border?(height, width, i, j)
  return i == 0 || j == 0 || i == height - 1 || j == width - 1
end

def in_border?(height, width, i, j)
  return i >= 0 && i < height && j >= 0 && j < width
end
