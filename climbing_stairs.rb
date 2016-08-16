# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return n if n <= 2
  i = 3
  a,b,c = 1,2,3
  
  while i < n do
    a = b
    b = c
    c = a+b
    i += 1
  end

  return c
end
