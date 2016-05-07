# @param {Integer} k
# @param {Integer} n
# @return {Integer[][]}
def combination_sum3(k, n)
  combinations = []
  return combinations if (19 - k) * k / 2 < n || n < 1 || k < 1
  queue = []

  (1..9).each do |i|
    queue << [[i], i]
  end

  while !queue.empty? do
    path, sum = queue.shift
    if path.length == k && sum == n
      combinations << path
    end
    if path.length < k && sum < n
      last_num = path[-1]
      if last_num < 9
        ((last_num + 1)..9).each do |i|
          queue << [path + [i], sum + i]
        end
      end
    end
  end
  combinations
end
