# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  cnt_r = 0
  cnt_w = 0
  cnt_b = 0

  nums.each do |num|
    case num
    when 0
      cnt_r += 1
    when 1
      cnt_w += 1
    when 2
      cnt_b += 1
    end
  end

  nums.each_with_index do |num, i|
    if i < cnt_r
      nums[i] = 0
    elsif i >= cnt_r && i < cnt_r + cnt_w
      nums[i] = 1
    else
      nums[i] = 2
    end
  end
end
