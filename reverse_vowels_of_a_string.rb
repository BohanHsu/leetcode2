# @param {String} s
# @return {String}
def reverse_vowels(s)
  arr = s.chars
  vowels = []
  arr.each_with_index do |chr, i|
    if is_vowel(chr)
      vowels << chr
      arr[i] = nil
    end
  end

  arr.each_with_index do |chr, i|
    if chr.nil?
      arr[i] = vowels.pop
    end
  end

  return arr.join("")
end

def is_vowel(c)
  return "a" == c || "e" == c || "i" == c || "o" == c || "u" == c || "A" == c || "E" == c || "I" == c || "O" == c || "U" == c
end
