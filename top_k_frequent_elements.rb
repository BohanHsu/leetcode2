# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  counts = {}
  nums.each do |i|
    if !counts.has_key?(i)
      counts[i] = 0
    end
    counts[i] += 1
  end

  arr = counts.keys.sort_by do |i|
    counts[i]
  end.reverse

  return arr[0...k]
end
