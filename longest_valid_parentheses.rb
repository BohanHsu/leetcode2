# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  stack = []
  invalid_close = []
  s.chars.each_with_index do |chr, i|
    if chr == "("
      stack << i
    else
      if stack.empty?
        invalid_close << i
      else
        stack.pop
      end
    end
  end

  all_invalid = [-1]
  i = 0
  j = 0
  while i < stack.length || j < invalid_close.length do
    if i == stack.length && j < invalid_close.length
      all_invalid << invalid_close[j]
      j += 1
    end

    if i < stack.length && j == invalid_close.length
      all_invalid << stack[i]
      i += 1
    end

    if i < stack.length && j < invalid_close.length
      if stack[i] < invalid_close[j]
        all_invalid << stack[i]
        i += 1
      else
        all_invalid << invalid_close[j]
        j += 1
      end
    end
  end

  all_invalid << s.length

  max_len = -1
  (0...(all_invalid.length-1)).each do |i|
    cur_len = all_invalid[i+1] - all_invalid[i] - 1
    if cur_len > max_len
      max_len = cur_len
    end
  end

  return max_len
end
