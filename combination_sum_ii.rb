# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  combinations = []
  candidates.sort!
  queue = []
  prev = nil
  candidates.each_with_index do |num, i|
    if prev.nil? || num != prev
      queue << [[num], num, i]
    end
    prev = num
  end

  while !queue.empty? do
    path, sum, num_index = queue.shift

    if sum == target
      combinations << path
      next
    elsif sum > target
      next
    end

    if num_index < candidates.length - 1
      prev = nil
      candidates[((num_index + 1)...candidates.length)].each_with_index do |num, i|
        if prev.nil? || prev != num
          queue << [path + [num], sum + num, (num_index + 1 + i)]
        end
        prev = num
      end
    end
  end
  combinations
end
