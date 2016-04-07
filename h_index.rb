# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  map = citations.map do 
    0
  end
  citations.each do |citation|
    if citation >= citations.length
      map[map.length-1] += 1
    elsif citation > 0
      map[citation - 1] += 1
    end
  end

  (1...map.length).each do |i|
    map[map.length - 1 - i] += map[map.length - i]
  end

  (0...map.length).each do |i|
    if map[map.length - i - 1] >= map.length - i
      return map.length - i
    end
  end
  0
end
