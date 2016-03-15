# @param {String[]} words
# @return {Integer}
def max_product(words)

end

def bit_map(str)
  result = 0
  str.chars.each do |char|
    result |= 1 << (char.ord - 97)
  end
  result
end
