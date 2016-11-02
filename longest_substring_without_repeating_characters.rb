# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  hsh = {}
  max_len = 0
  j = -1
  s.chars.each_with_index do |chr, i|
    if hsh.has_key?(chr)
      j = [j, hsh[chr]].max
    end
    max_len = [max_len, (i-j)].max
    hsh[chr] = i
  end
  return max_len
end
