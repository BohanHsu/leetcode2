# @param {String[]} words
# @return {Integer}
def max_product(words)
  max_prod = 0
  bit_maps = words.map do |word|
    bit_map word
  end
  len = words.length
  len.times do |i|
    ((i + 1)...len).each do |j|
      if bit_maps[i] & bit_maps[j] == 0
        max_prod = [max_prod, words[i].length * words[j].length].max
      end
    end
  end
  max_prod
end

def bit_map(str)
  result = 0
  str.chars.each do |char|
    result |= 1 << (char.ord - 97)
  end
  result
end
