# @param {Integer} n
# # @return {Integer}
def bulb_switch(n)
  sqrt(n)
end

def sqrt(n)
  return 0 if n == 0
  return 1 if n < 4
  return 2 if n == 4

  from = 2
  to = n / 2
  i = (from + to) / 2

  while from <= to do
    return from if is_squt(from, n)
    return to if is_squt(from, n)
    return i if is_squt(i, n)
    if i ** 2 > n
      to = i
    elsif (i + 1) ** 2 <= n
      from = i
    end
    i = (from + to) / 2
  end

  return i
end

def is_squt(m, n)
  return m ** 2 <= n && (m+1) ** 2 > n
end
