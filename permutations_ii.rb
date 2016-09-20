# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  return [] if nums.length == 0
  return [[nums[0]]] if nums.length == 1
  cur = [[nums[0]]]
  while cur[0].length < nums.length
    n_num = cur[0].length + 1
    n_hsh = {}
    cur.each do |row|
      n_num.times do |i|
        new_row = row.clone
        new_row.insert(i, nums[n_num-1])
        if !n_hsh.has_key?(get_str(new_row))
          n_hsh[get_str(new_row)] = new_row
        end
      end
    end
    cur = n_hsh.values
  end
  return cur
end

def get_str(arr)
  return arr.join(" ")
end
