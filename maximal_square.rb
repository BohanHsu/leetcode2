# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  return 0 if matrix.length == 0 || matrix[0].length == 0


  if matrix[0].class == String
    matrix = [matrix]
  end

  matrix.each do |row|
    row.map! do |chr|
      chr.to_i
    end
  end

  cur_line = matrix[0]
  max = max_in_line cur_line
  (1...matrix.length).each do |i|
    new_line = Array.new matrix[i]
    cur_line = new_line.length.times.map do |j|
      if new_line[j] == 0
        0
      else
        cur_line[j] + 1
      end
    end
    max = [max, max_in_line(cur_line)].max
  end
  max
end

def max_in_line(line)
  max = -1
  stack = []

  line.each_with_index do |num, i|
    while !stack.empty? && line[stack[-1]] >= num do
      j = stack.pop
      max = [max, [(i - j), line[j]].min ** 2].max
    end
    max = [[num, (i - (stack.empty? ? -1 : stack[-1]))].min ** 2, max].max
    stack << i
  end

  queue = stack
  while !queue.empty? do
    j = queue[0]
    while j >= 1 && line[j-1] == line[j] do
      j -= 1
    end
    max = [max, [(line.length - 1 - j  + 1), line[queue.shift]].min ** 2].max
  end
  max
end
