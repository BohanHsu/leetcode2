# @param {Character[][]} matrix
# @return {Integer}
def maximal_rectangle(matrix)
  return 0 if matrix.length == 0 || matrix[0].length == 0
  line = nil
  max_area = 0

  matrix.each_with_index do |row, i|
    if i == 0
      line = row.map do |element|
        element.to_i
      end
    else
      #puts "=" * 10
      #puts "row=#{row}"
      (0...line.length).each do |j|
        if row[j] == "0"
          line[j] = 0
        else
          line[j] += 1
        end
      end
    end

    max_area = [maximal_rectangle_line(line), max_area].max
  end

  return max_area
end

def maximal_rectangle_line(line)
  #puts "line=#{line}"
  stack = []
  max_area = 0
  line.each_with_index do |e, i|
    #puts "=" * 10
    #puts "i=#{i}"
    while !stack.empty? && e < line[stack[-1]] do

      cur_max = (i - (stack.length > 1 ? stack[-2] + 1 : 0)) * line[stack[-1]]


      #puts "stack[-1]=#{stack[-1]}, width=#{(i - stack[-1])}, height=#{line[stack[-1]]}, cur_max=#{cur_max}"
      max_area = [max_area, cur_max].max
      stack.pop
    end
    stack << i
  end

  #puts "=" * 20
  #puts "stack=#{stack}"
  #puts "=" * 20

  i = line.length
  while !stack.empty? do
    cur_max = (i - (stack.length > 1 ? stack[-2] + 1 : 0)) * line[stack[-1]]
    #puts "=" * 10
    #puts "stack[-1]=#{stack[-1]}, width=#{(i - stack[-1])}, height=#{line[stack[-1]]}, cur_max=#{cur_max}"
    max_area = [max_area, cur_max].max
    stack.pop
  end
  return max_area
end
