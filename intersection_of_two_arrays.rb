# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersection(nums1, nums2)
  if nums1.length < nums2.length
    n1 = nums1
    n2 = nums2
  else
    n1 = nums2
    n2 = nums1
  end

  hsh = {}

  n1.each do |ele|
    hsh[ele] = false
  end

  n2.each do |ele|
    if hsh.has_key?(ele)
      hsh[ele] = true
    end
  end

  result = []

  hsh.each do |k, v|
    if v
      result << k
    end
  end

  return result
end
