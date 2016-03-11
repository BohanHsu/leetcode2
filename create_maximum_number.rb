# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[]}
def max_number(nums1, nums2, k)
  from = [k - nums2.length, 0].max
  to = [k, nums1.length].min

  result = []

  (from..to).each do |n1|
    n2 = k - n1
    cur_res = merge(max_n_number(nums1, n1), max_n_number(nums2, n2))
    if compare(result, cur_res) > 0
      result = cur_res
    end
  end

  result
end

def max_n_number(nums, n)
  result = []
  nums.each_with_index do |ele, idx|
    #puts "ele=#{ele}, f1=#{!result.empty?}, f2=#{n - result.length}, #{(nums.length  - 1 - idx)}, result=#{result}"
    while !result.empty? && n - result.length <= (nums.length  - 1 - idx) && result.last < ele do
      result.pop
    end
    if result.length < n
      result << ele
    end
  end
  result
end

def merge(nums1, nums2)
  result = []
  while !nums1.empty? || !nums2.empty? do
    compare_result = compare(nums1, nums2)
    if compare_result < 0
      result << nums1.shift
    else
      result << nums2.shift
    end
  end
  return result
end

def compare(nums1, nums2)
  if nums1.empty? && nums2.empty?
    return 0
  end
  if nums1.empty?
    return 1
  end
  if nums2.empty?
    return -1
  end
  i = 0
  j = 0
  while i < nums1.length || j < nums2.length do
    #if i >= nums1.length && j >= nums2.length
    #  return 0
    #end
    if nums1[i%nums1.length] < nums2[j%nums2.length]
      return 1
    elsif nums1[i%nums1.length] > nums2[j%nums2.length]
      return -1
    else
      i += 1
      j += 1
    end
  end
  if nums1[i%nums1.length] > nums2[j%nums2.length]
    return -1
  elsif nums1[i%nums1.length] < nums2[j%nums2.length]
    return 1
  else
    return 0
  end
end
