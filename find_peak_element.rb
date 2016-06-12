# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  from = 0
  to = nums.length

  while true do
    i = (from + to) / 2
    #puts "from=#{from}, to=#{to}, i=#{i}"
    dir = direction(nums, i)

    if dir == :peak
      return i
    elsif dir == :left
      to = i
    else
      from = i
    end
  end
  nil
end

def direction(nums, m)
  if m == 0
    l_n = -Float::INFINITY
  else
    l_n = nums[m-1]
  end

  if m == nums.length - 1
    r_n = -Float::INFINITY
  else
    r_n = nums[m+1]
  end

  val = nums[m]

  if val > l_n && val > r_n
    return :peak
  elsif val < r_n && val > l_n
    return :right
  else
    return :left
  end
end
