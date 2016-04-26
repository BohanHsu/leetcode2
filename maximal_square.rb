# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
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
    max = [max, max_in_line cur_line].max
  end
  max
end

def max_in_line(line)
  max = -1
  stack = []

  line.each_with_index do |num, i|
    while !stack.empty? && line[stack[-1]] >= num do
      area = num * (i - stack.pop + 1)
      max = [max, area].max
    end
    stack << i
  end

  queue = stack
  while !queue.empty? do
    area = (queue[-1] - queue[0] + 1) * line[queue.shift]
    max = [max, area].max
  end

  max
end
