# @param {String} s
# @return {String}
def longest_palindrome(s)
  max_str = ""
  k = 0
  while k < s.length do
    str1 = check_palindrome(s, k, k)
    str2 = check_palindrome(s, k, k+1)
    if max_str.length < str1.length
      max_str = str1
    end
    if max_str.length < str2.length
      max_str = str2
    end
    k += 1
  end
  return max_str
end

def check_palindrome(s, i, j)
  len = -1
  while i >=0 && j < s.length && s[i] == s[j] do
    len = j - i + 1
    i -= 1
    j += 1
  end
  return s[i+1..j-1]
end
