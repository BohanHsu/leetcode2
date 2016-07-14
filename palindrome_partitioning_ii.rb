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

  (3..s.length).each do |len|
    (0..(s.length - len)).each do |i|
      j = i + len - 1
      @mask[i][j] = s[i] == s[j] && @mask[i+1][j-1]
      #puts "i=#{i}, j=#{j}, @mask[i][j]=#{@mask[i][j]}"
    end
  end

  def is_palindrome(i, j)
    return @mask[i][j]
  end

  cuts = (s.length+1).times.map do
    Float::INFINITY
  end
  cuts[0] = -1

  (0...s.length).each do |i|
    (0..i).each do |j|
      if is_palindrome(j, i)
        cuts[i+1] = [cuts[j] + 1, cuts[i+1]].min
      end
    end
  end

  return cuts.last
end
