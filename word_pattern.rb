# @param {String} pattern
# @param {String} str
# @return {Boolean}
def word_pattern(pattern, str)
  patterns = pattern.split(//)
  strs = str.split(/\s/)

  return false if patterns.length != strs.length

  p_s = {}
  s_p = {}

  patterns.each_with_index do |p, idx|
    if p_s.has_key?(p)
      if !(p_s[p] == strs[idx] && !s_p[strs[idx]].nil? && s_p[strs[idx]] == p)
        return false
      end
    else
      if s_p.has_key?(strs[idx])
        return false
      end

      p_s[p] = strs[idx]
      s_p[strs[idx]] = p
    end
  end

  return true
end
