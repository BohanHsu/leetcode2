# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  return true if s == ""

  i = 0
  while i < s.length && !is_letter(s, i) do
    i += 1
  end

  j = s.length - 1
  while j >= 0 && !is_letter(s, j) do
    j -= 1
  end

  while i < j do
    return false if !compare(s, i, j)

    i += 1
    while i < s.length && !is_letter(s, i) do
      i += 1
    end

    j -= 1
    while j >= 0 && !is_letter(s, j) do
      j -= 1
    end
  end

  return true
end

def is_letter(s, i)
  return (s[i].ord >= 'a'.ord && s[i].ord <= 'z'.ord) || (s[i].ord >= 'A'.ord && s[i].ord <= 'Z'.ord) || (s[i].ord >= '0'.ord && s[i].ord <= '9'.ord)
end

def compare(s, i, j)
  return s[i].downcase == s[j].downcase
end
