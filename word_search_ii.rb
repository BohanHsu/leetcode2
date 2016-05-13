# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}
def find_words(board, words)
  results = []
  #return true if word == ""

  height = board.length
  return false if height == 0
  width = board[0].length

  in_tire = {}
  tire = Node.new([])

  words.each do |word|
    if in_tire.has_key?(word[0]) && !in_tire[word[0]]
      #
    end
    find_flag = false
    height.times do |i|
      width.times do |j|
        if word[0] == board[i][j] && search_from(board, word, i, j, tire)
          results << word
          find_words = true
          break
        end
      end
      break if find_words
    end

    if !find_words
      in_tire
    end
  end
    
  results
end

def search_from(board, word, arg_i, arg_j, tire)
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

class Node
  attr_accessor :prefix, :children
  def initialize(prefix)
    @prefix = prefix
    @children = nil
  end

  def add_child(child)
    @children = {} if @children.nil?
    @children[child] = Node.new(@prefix + [child]) if !@children.has_key?(child)
    return @children[child] 
  end
end
