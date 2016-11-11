# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  if nums2.empty?
    tmp = nums1
    nums1 = nums2
    nums2 = tmp
  end
  if nums1.empty?
    if nums2.length % 2 == 0
      return (nums2[nums2.length/2-1] + nums2[nums2.length/2]) / 2.0
    else
      return nums2[nums2.length/2]
    end
  end

  len = (nums1.length + nums2.length)
  is_odd = (len % 2 == 1)

  2.times do
    tmp = nums1
    nums1 = nums2
    nums2 = tmp

    #puts "nums1=#{nums1}"
    #puts "nums2=#{nums2}"
    from = 0
    to = nums1.length
    i = (from + to) / 2
    last_i = -1
    while i != last_i do
      j = (len-1) / 2 - i
      #puts "i=#{i}, j=#{j}"
      if j < 0
        to = i
      elsif j > nums2.length
        from = i
      else
        #puts "i=#{i}, j=#{j}, nums1[i]=#{nums1[i]}, nums2[j]=#{nums2[j]}"
        if j == 0 && nums1[i] <= nums2[j] || j == nums2.length && nums1[i] >= nums2[j-1] || nums1[i] >= nums2[j-1] && nums1[i] <= nums2[j]
          if is_odd
            return nums1[i]
          else
            if j == nums2.length
              return (nums1[i] + nums1[i+1]) / 2.0
              
            elsif i < nums1.length - 1
              return ([nums1[i+1], nums2[j]].min + nums1[i]) / 2.0
            else
              return (nums2[j] + nums1[i]) / 2.0
            end
          end
        else
          if j != nums2.length && nums1[i] > nums2[j] || j == 0 && nums1[i] > nums2[j]
            to = i
          elsif j != 0 && nums1[i] < nums2[j-1] || j == nums2.length && nums1[i] < nums2[j-1]
            from = i
          end
        end
      end

      last_i = i
      i = (from + to) / 2
    end
  end
  nil
end
