# @param {Integer} n
# @return {Integer}
def num_trees(n)
  hsh = {0 => 1, 1 => 1, 2 => 2}
  return hsh[n] if n <= 2

  i = 3
  while i <= n do
    cnt = 0
    (0..i-1).each do |j|
      cnt += hsh[i-1-j] * hsh[j]
    end

    hsh[i] = cnt
    i += 1
  end

  hsh[n]
end
