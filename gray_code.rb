# @param {Integer} n
# @return {Integer[]}
def gray_code(n)
  return [0] if n == 0
  gray_code_helper(n)
end

def gray_code_helper(n)
  return [0,1] if n == 1
  tmp = gray_code_helper(n-1)
  offset = 2**(n-1)
  return tmp + (tmp.reverse.map {|i| i + offset})
end
