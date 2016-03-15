# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
  matrix = 26.times.map do
    26.times.map do
      false
    end
  end
  idx_before = {}

  s.chars.each do |char|
    cur_idx = char.ord - 97
    idx_before.keys.each do |k|
      if k != cur_idx
        matrix[cur_idx][k] = true
      end
    end
    if idx_before[cur_idx].nil?
      idx_before[cur_idx] = false
    else
      idx_before[cur_idx] = true
    end
  end

  stack = []
  s.chars.reverse.each do |char|
    stack << (char.ord - 97)
    if !idx_before[(char.ord - 97)]
      break
    end
  end

end
