# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  buffer = n.times.map do
    1
  end

  (m - 1).times do |j|
    (1...n).each do |i|
      buffer[i] = buffer[i] + buffer[i-1]
    end
  end

  return buffer.last
end
