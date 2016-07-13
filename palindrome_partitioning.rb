# @param {String} s
# @return {String[][]}
def partition(s)
  result = []
  path = []

  partition_helper(s, 0, path, result)

  result
end

def partition_helper(s, i, path, result)
  if i == s.length
    result << path.clone
  end

  (i...s.length).each do |j|
    if is_palindrome(s[i..j])
      path << s[i..j]
      partition_helper(s, j+1, path, result)
      path.pop
    end
  end
end

def is_palindrome(s)
  if s.length <= 0
    return true
  end

  (0...(s.length / 2)).each do |i|
    if s[i] != s[s.length - 1 - i]
      return false
    end
  end
  return true
end
