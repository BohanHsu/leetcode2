# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
def full_justify(words, max_width)
  i = 0
  arr = []
  while i < words.length do
    cur = []
    cur_len = 0
    while i < words.length && cur_len + (words[i].length) <= max_width do
      cur_len += (1 + words[i].length)
      cur << words[i]
      i += 1
    end
    arr << cur
  end

  result = arr.each_with_index.map do |ws, i|
    if i == arr.length - 1
      last_line_space(ws, max_width)
    else
      add_spaces(ws, max_width)
    end
  end

  return result
end

def add_spaces(words, max_width)
  str = ""
  if words.length == 1
    str += words[0]
    str += " " * (max_width - words[0].length)
  else
    total_length = words.inject(0) do |memo, obj|
      memo + obj.length
    end

    split = words.length - 1
    base_spaces = (max_width - total_length) / split
    bias_split = (max_width - total_length) % split

    words.each_with_index do |word, i|
      str += word
      if i < words.length - 1
        str += (" " * base_spaces)
        if i < bias_split
          str += " "
        end
      end
    end
  end
  return str
end

def last_line_space(words, max_width)
  str = ""
  words.each_with_index do |word, i|
    str += word
    if i < words.length - 1
      str += " "
    end
  end

  str += (" " * (max_width - str.length))
  return str
end
