# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  from = 0
  to = x
  while true do
    return from if check_sqrt(x, from)
    return to if check_sqrt(x, to)
    i = (from + to) / 2
    return i if check_sqrt(x, i)
    if i ** 2 < x
      from = i
    elsif i ** 2 > x
      to = i
    end
  end

  return -1
end

def check_sqrt(x, num)
  return num ** 2 <= x && (num+1) ** 2 > x
end
