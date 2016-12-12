# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  (0...(haystack.length - needle.length + 1)).each do |i|
    match = true
    needle.chars.each_with_index do |chr2, j|
      if chr2 != haystack[i+j]
        match = false
        break
      end
    end
    return i if match
  end
  return -1
end
