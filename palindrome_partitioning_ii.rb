# @param {String} s
# @return {Integer}
def min_cut(s)
  @mask = s.length.times.map do
    s.length.times.map do
      false
    end
  end

  s.length.times do |i|
    @mask[i][i] = true
    if i != 0 && s[i-1] == s[i]
      @mask[i-1][i] = true
    end
  end

  s.length.times do |i|
    ((i + 2)...(s.length)).each do |j|
      @mask[i][j] = s[i] == s[j] && @mask[i+1][j-1]
    end
  end

  def is_palindrome(i, j)
    return @mask[i][j]
  end

  def min_cut_helper(s, i, cur_len, cur_min)
    if cur_len - 1 > cur_min
      return cur_min
    end
  
    if i == s.length
      return cur_len - 1
    end
  
    (s.length-1).downto(i).each do |j|
      #if is_palindrome(s[i..j])
      if is_palindrome(i, j)
        cur_len += 1
        cur_min = [min_cut_helper(s, j+1, cur_len, cur_min), cur_min].min
        cur_len -= 1
      end
    end
  
    cur_min
  end

  return min_cut_helper(s, 0, 0, Float::INFINITY)
end
