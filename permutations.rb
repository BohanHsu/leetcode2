# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  return [] if nums.length == 0
  return [[nums[0]]] if nums.length == 1
  cur = [[nums[0],nums[1]], [nums[1],nums[0]]]
  while cur[0].length < nums.length
    n_num = cur[0].length + 1
    n_array = []
    cur.each do |row|
      n_num.times do |i|
        new_row = row.clone
        new_row.insert(i, nums[n_num-1])
        n_array << new_row
      end
    end
    cur = n_array
  end
  return cur
end
