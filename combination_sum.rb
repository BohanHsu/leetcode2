# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  combinations = []
  candidates.sort!
  queue = []
  candidates.each do |num|
    queue << [[num], num]
  end

  while !queue.empty? do
    path, sum = queue.shift

    if sum == target
      combinations << path
      next
    elsif sum > target
      next
    end

    candidates[(candidates.find_index(path[-1])...candidates.length)].each do |num|
      queue << [path + [num], sum + num]
    end
  end

  combinations
end
