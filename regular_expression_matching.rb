# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  pattern = [:start]
  self_link = [false]
  p.chars.each do |chr|
    if chr == "*"
      self_link[-1] = true
    else
      pattern << chr
      self_link << false
    end
  end
  pattern << :end
  self_link << false

  #puts "pattern=#{pattern}"
  #puts "self_link=#{self_link}"

  matrix = pattern.map do
    pattern.map do
      false
    end
  end

  pattern.length.times do |i|
    if i < pattern.length - 1
      matrix[i][i+1] = true
    end

    if self_link[i]
      matrix[i][i] = true
      #matrix[i-1][i+1] = true
      (0..i).each do |j|
        if matrix[j][i]
          matrix[j][i+1] = true
        end
      end
    end
  end

  #puts "===matrix==="
  #matrix.each do |row|
  #  puts "#{row}"
  #end

  str = [:start] + s.chars + [:end]
  #puts "str=#{str}"
  queue = get_next_nodes(str, 0, pattern, 0, matrix)
  while !queue.empty? do
    i, j = queue.shift
    if i == str.length - 1 && j == pattern.length - 1
      return true
    end
    if i < str.length
      queue += get_next_nodes(str, i, pattern, j, matrix)
    end
  end
  return false
end

def get_next_nodes(str, i, pattern, k, matrix)
  result = matrix[k].each_with_index.map do |connect, j|
    #puts "pattern[j]=#{pattern[j]}, str[i+1]=#{str[i+1]}, equals=#{pattern[j] == str[i+1]}, connect=#{connect}"
    if connect && (pattern[j] == str[i+1] || pattern[j] == ".")
      [i+1, j]
    else
      [i+1, nil]
    end
  end.select do |pair|
    !pair[1].nil?
  end

  #puts "i=#{i}, str[i]=#{str[i]}, k=#{k}, pattern[k]=#{pattern[k]}, result=#{result.map {|pair| "[i=#{pair[0]}, str[i]=#{str[pair[0]]}, j=#{pair[1]}, pattern[j]=#{pattern[pair[1]]}]"}}"

  return result
end
