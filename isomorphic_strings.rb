# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  return false if s.length != t.length
  dict = {}
  r_dict = {}

  (0...s.length).each do |i|
    if !dict.has_key?(s[i])
      dict[s[i]] = t[i]
    elsif dict[s[i]] != t[i]
      return false
    end

    if !r_dict.has_key?(t[i])
      r_dict[t[i]] = s[i]
    elsif r_dict[t[i]] != s[i]
      return false
    end
  end

  true
end
