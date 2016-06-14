# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  return nil if nums.length == 0
  return nums[0] if nums.length == 1
  from = 0
  to = nums.length - 1

  cur_min = Float::INFINITY
  queue = [[from, to]]

  while !queue.empty? do
    from, to = queue.shift
    i = (from + to) / 2
    puts "from=#{from}, to=#{to}, i=#{i}"

    cur_min = [nums[from], cur_min].min if is_minimum(nums, from)
    cur_min = [nums[i], cur_min].min if is_minimum(nums, i)
    cur_min = [nums[to], cur_min].min if is_minimum(nums, to)

    if nums[from] < nums[i]
      queue << [i, to]
    elsif nums[from] > nums[i]
      queue << [from, i]
    else
      if to == from + 1
        cur_min = [cur_min, nums[from]].min
      else
        queue << [from, i]
        queue << [i, to]
      end
    end
  end
  cur_min
end

def is_minimum(nums, i)
  if i == 0
    return nums[0] < nums[nums.length - 1]
  end
  return nums[i] < nums[i-1]
end
