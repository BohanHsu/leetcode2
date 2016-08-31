# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  return 0 if nums.empty?
  min_val = 0
  max_val = nums[0]
  sum = 0
  cur_max = -Float::INFINITY

  nums.each do |num|
    min_val = [sum, min_val].min
    sum += num
    max_val = [sum, max_val].max
    cur_max = [cur_max, sum - min_val].max
    #puts "num=#{num}, sum=#{sum}, min_val=#{min_val}, max_val=#{max_val}, cur_max=#{cur_max}"
  end

  return cur_max
end
