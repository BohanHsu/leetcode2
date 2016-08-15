# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  return "" if s.length < t.length

  hs = {}
  ht = {}
  t.chars.each do |chr|
    if !ht.has_key?(chr)
      ht[chr] = 0
    end
    ht[chr] += 1
  end

  i = 0
  j = 0
  #puts "hs=#{hs}, ht=#{ht}"

  while j < s.length && !check_include(hs, ht) do
    if !hs.has_key?(s[j])
      hs[s[j]] = 0
    end
    hs[s[j]] += 1
    j += 1
  end
  #puts "hs=#{hs}, ht=#{ht}"

  if !check_include(hs, ht)
    return ""
  end

  global_min = j - i
  global_min_str = s[i...j]

  while j < s.length || j == s.length && check_include(hs, ht) do
    #puts "hs=#{hs}, ht=#{ht}"
    if check_include(hs, ht)
      # sub part contains t
      while i < j && check_include(hs, ht) do
        if j-i < global_min
          global_min = j-i
          global_min_str = s[i...j]
        end
        hs[s[i]] -= 1
        #puts "-: #{s[i]}, (i=#{i})"
        i += 1
      end
    else
      # sub NOT part contains t
      while j < s.length && !check_include(hs, ht)
        if !hs.has_key?(s[j])
          hs[s[j]] = 0
        end
        hs[s[j]] += 1
        #puts "+: #{s[j]}"
        j += 1
      end

      #global_min = [j-i, global_min].min
      if j-i < global_min
        global_min = j-i
        global_min_str = s[i...j]
      end
    end
    #puts "i=#{i}, j=#{j}, (j=#{j})"
  end
  #puts "hs=#{hs}, ht=#{ht}"

  return global_min_str
end

def check_include(hs, ht)
  #puts "hs=#{hs}, ht=#{ht}"
  ht.each do |k, v|
    return false if !hs.has_key?(k) || hs[k] < v
  end

  return true
end
