# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  found_word = false
  word_end = nil
  s.length.times do |j|
    i = s.length - 1 - j
    if found_word
      if s[i] == " "
        return word_end-i
      end
    else
      if s[i] != " "
        found_word = true
        word_end = i
      end
    end
  end
  if found_word
    return word_end + 1
  else
    return 0
  end
end
