# @param {Integer} n
# @return {Integer}
def count_primes(n)
  return 0 if n <= 2
  masks = n.times.map do
    true
  end

  i = 2
  while i * i <= n do
    if masks[i]
      j = i
      while i * j < n do
        masks[i * j] = false
        j += 1
      end
    end
    i += 1
  end

  masks[0] = false
  masks[1] = false
  masks.select do |is_prime|
    is_prime
  end.length
end
