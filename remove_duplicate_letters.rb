# @param {String} s
# @return {String}
def remove_duplicate_letters(s)
  letters = 0
  s.chars.each do |char|
    letters |= 1 << (char.ord - 97)
  end

  str = ""
  (0...26).each do |i|
    if (letters & (1 << i)) != 0
      str += (i + 97).chr
    end
  end
  str
end
