# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_min_height_trees(n, edges)
  hsh = {}
  n.times do |i|
    hsh[i] = {}
  end

  edges.each do |edge|
    hsh[edge[0]][edge[1]] = true
    hsh[edge[1]][edge[0]] = true
  end

  cur_level = {}
  next_level = {}

  n.times do |i|
    cur_level[i] = true if hsh[i].size == 1
  end

  while hsh.size >= 1 do
    return hsh.keys if hsh.size <= 2
    cur_level.keys.each do |leaf|
      hsh[leaf].keys.each do |protential_leaf|
        hsh[protential_leaf].delete(leaf)
        next_level[protential_leaf] = true if hsh[protential_leaf].size == 1
      end
      hsh.delete(leaf)
    end
    cur_level = next_level
    next_level = {}
  end
end
