# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  last_star = -1
  last_match_to = -1

  i = 0
  j = 0

  while i < s.length do
    puts "i=#{i}, j=#{j}, s[#{i}]=#{s[i]}, p[#{j}]=#{p[j]}"
    if p[j] == "*"

      while j < p.length && p[j] == "*" do
        j += 1
      end
      j -= 1
      if j + 1 == p.length
        return true
      else
        while !compare(s, i , p, j+1) do
          i += 1
          return false if i >= s.length
        end
        last_star = j
        last_match_to = i
        i += 1
        j += 2
      end
    else
      if compare(s, i, p, j)
        i += 1
        j += 1
      else
        if last_star < 0
          return false
        else
          i = last_match_to + 1
          j = last_star + 1
          
          while !compare(s, i, p, j) do
            i += 1
            return false if i >= s.length
          end

          last_match_to = i
          i += 1
          j += 2
        end
      end
    end
  end

  #puts "out loop :i=#{i}, j=#{j}"

  return true if j == p.length
  (j...p.length).each do |k|
    return false if p[k] != "*"
  end
  return true
end

def compare(s, i, p, j)
  return true if p[j] == '?'
  return s[i] == p[j]
end
