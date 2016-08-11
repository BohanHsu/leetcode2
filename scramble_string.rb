# @param {String} s1
# @param {String} s2
# @return {Boolean}
def is_scramble(s1, s2)
  #return false if s1.length != s2.length
  return is_scramble_helper(s1, s2)
end

def is_scramble_helper(s1, s2)
  return false if s1.length != s2.length
  if s1 == s2
    return true
  end

  if s1.length == 2 && s2.length == 2
    return s1[0] == s2[1] && s1[1] == s2[0]
  end

  i = 0
  balance = {}
  while i < s1.length do
    if s1[i] != s2[i]
      if !balance.has_key?(s1[i])
        balance[s1[i]] = 0
      end
      balance[s1[i]] += 1

      if !balance.has_key?(s2[i])
        balance[s2[i]] = 0
      end
      balance[s2[i]] -= 1
    end

    if i != s1.length-1 && check_balance(balance)
      return is_scramble_helper(s1[0..i], s2[0..i]) && is_scramble_helper(s1[(i+1)...s1.length], s2[(i+1)...s2.length])
    end
    i += 1
  end

  i = 0
  balance = {}
  while i < s1.length do

    if s1[i] != s2[s2.length-1-i]
      if !balance.has_key?(s1[i])
        balance[s1[i]] = 0
      end
      balance[s1[i]] += 1

      if !balance.has_key?(s2[s2.length-1-i])
        balance[s2[s2.length-1-i]] = 0
      end
      balance[s2[s2.length-1-i]] -= 1
    end

    if i != s1.length - 1 && check_balance(balance)
      return is_scramble_helper(s1[0..i], s2[(s2.length-1-i)...(s2.length)]) && is_scramble_helper(s1[(i+1)...s1.length], s2[0...s2.length-1-i])
    end
    i += 1
  end

  return false
end

def check_balance(balance)
  balance.each do |k, v|
    return false if v != 0
  end
  return true
end
