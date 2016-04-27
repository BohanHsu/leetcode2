# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  return 0 if matrix.length == 0 || matrix[0].length == 0

  matrix.map! do |row|
    row.map do |chr|
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
  max_area = -1
  buffer = []
  line.each_with_index do |num, i|
    if !buffer.empty? && line[buffer[-1]] > num
      while !buffer.empty? && line[buffer[-1]] > num do
        j = buffer.pop
        max_area = [max_area, get_square(line[j], (i - j))].max
        max_area = [max_area, get_square(line[j], (i - (buffer.empty? ? 0 : buffer[-1] + 1)))].max
      end
    end

    buffer << i
  end

  j = 0
  while j < buffer.length do
    k = j - 1
    while k >= 0 && line[buffer[k]] == line[buffer[j]] do
      k -= 1
    end

    max_area = [max_area, get_square((buffer[-1] - (k < 0 ? -1 : buffer[k])), line[buffer[j]])].max
    j += 1
  end

  max_area
end

def get_square(a, b)
  [a, b].min ** 2
end
