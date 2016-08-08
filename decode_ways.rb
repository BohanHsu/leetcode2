# @param {String} s
# @return {Integer}
def num_decodings(s)
  return 0 if s.length == 0
  cache = {}
  num_decodings_helper(s, 0, cache)
  #puts cache
  return cache[0]
end

def num_decodings_helper(s, from, cache)
  if cache.has_key?(from)
    return cache[from]
  end

  if from >= s.length
    return 1
  end

  cnt = 0
  if !is_code(s, from, from).nil?
    cnt += num_decodings_helper(s, from+1, cache)
  end

  if from + 1 < s.length && !is_code(s, from, from+1).nil?
    cnt += num_decodings_helper(s, from+2, cache)
  end

  if !cache.has_key?(from)
    cache[from] = cnt
  end

  #puts "from=#{from}, cnt=#{cnt}"

  return cnt
end

def is_code(s, from, to)
  if s[from] == '0'
    return nil
  end
  if from == to
    return (s[from].to_i + 64).chr
  elsif from == to - 1
    val = s[from].to_i * 10 + s[to].to_i
    if 1 <= val && val <= 26
      return (val + 64).chr
    else
      return nil
    end
  else
    return nil
  end
end
