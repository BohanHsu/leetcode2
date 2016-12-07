# @param {String} s
# @return {Integer}
def roman_to_int(s)
  res = 4.times.map {0}

  s.chars.each_with_index do |chr, i|
    if chr == "M"
      res[0] += 1
    elsif chr == "D"
      res[1] += 5
    elsif chr == "C"
      res[1] += 1
      if i + 1 < s.length
        if s[i + 1] == "M"
          res[1] += 8
          res[0] -= 1
        end
        if s[i + 1] == "D"
          res[1] -= 2
        end
      end
    elsif chr == "X"
      res[2] += 1
      if i + 1 < s.length
        if s[i + 1] == "C"
          res[2] += 8
          res[1] -= 1
        end
        if s[i + 1] == "L"
          res[2] -= 2
        end
      end
    elsif chr == "L"
      res[2] += 5
    elsif chr == "I"
      res[3] += 1
      if i + 1 < s.length
        if s[i + 1] == "X"
          res[3] += 8
          res[2] -= 1
        end
        if s[i + 1] == "V"
          res[3] -= 2
        end
      end
    elsif chr == "V"
      res[3] += 5
    end
    #puts "chr=#{chr}, i=#{i}, res=#{res}"
  end
  return res.each_with_index.map do |e, i|
    e * 1000 / (10 ** i)
  end.inject do |memo, obj|
    memo + obj
  end
end
