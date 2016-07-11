# @param {String} s
# @param {Set<String>} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  return false if s.length == 0
  in_dict = (s.length + 1).times.map {false}
  in_dict[0] = true
  (1..s.length).each do |i|
    (0...i).each do |j|
      if in_dict[j]
        if word_dict.include?(s[j...i])
          in_dict[i] = true
          break
        end
      end
    end
  end
  in_dict[s.length]
end
