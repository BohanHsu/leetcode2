# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  #puts "m=#{m}, n=#{n}"
  #puts "nums1=#{nums1}"
  #puts "nums2=#{nums2}"
  k = m + n - 1
  i = m - 1
  j = n - 1

  while i >= 0 || j >=0 do
    #puts "i=#{i}, j=#{j}, k=#{k}"
    if i < 0 || i >= 0 && j >= 0 && nums2[j] > nums1[i]
      #move j
      nums1[k] = nums2[j]
      j -= 1
    else
      nums1[k] = nums1[i]
      i -= 1
    end
    #puts "nums1[k]=#{nums1[k]}"
    k -= 1
  end
end
