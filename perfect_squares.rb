# @param {Integer} n
# @return {Integer}
def num_squares(n)
  hsh = {}
  queue = []
  range = get_range(n)

  range.each do |i|
    queue << [1, n - i**2]
    hsh[n-i**2] = true
  end

  while !queue.empty? do
    depth, diff = queue.shift
    return depth if diff == 0
    range = get_range(diff)
    range.each do |i|
      if !hsh.has_key? diff - i ** 2
        queue << [depth + 1, diff - i ** 2]
        hsh[diff - i ** 2] = true
      end
    end
  end
  nil
end

def get_range(n)
  to = Math.sqrt(n).to_i
  from = [to, Math.sqrt(n - to ** 2).to_i + 1].min
  return from..to
end
