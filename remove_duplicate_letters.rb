# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
  chars = s.chars
  counts = 26.times.map {0}
  selected = []
  in_selected = {}

  chars.each do |char|
    in_selected[char] = false
    idx = char.ord - 97
    counts[idx] += 1
  end

  res_length = in_selected.size

  i = 0
  while i < chars.length do
    if !in_selected[chars[i]]
      #puts "i=#{i}, chars[i]=#{chars[i]}"
      while (!selected.last.nil? && chars[i] < selected.last) && counts[selected.last.ord - 97] > 0 && chars.length - 1 - i >= res_length - selected.length do
        poped = selected.pop
        #puts "poped=#{poped}"
        in_selected[poped] = false
      end

      selected << chars[i]
      in_selected[chars[i]] = true
    end
    counts[chars[i].ord - 97] -= 1
    i += 1
  end
  selected.join("")
end
