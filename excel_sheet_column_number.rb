# @param {String} s
# @return {Integer}
def title_to_number(s)
  num = 0
  s.chars.each do |chr|
    num *= 26
    num += (chr.ord - 'A'.ord + 1)
  end
  return num
end
