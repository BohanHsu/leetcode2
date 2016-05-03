# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} t
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, k, t)
  hash = {}
  if k >= t
    nums.each_with_index do |num, i|
      ((num - t)..(num + t)).each do |j|
        if hash.has_key?(j) && i - hash[j] <= k
          #puts "num=#{num}, i=#{i}, j=#{j}, hash[j]=#{hash[j]}, k=#{k}"
          return true
        end
      end
      hash[num] = i
    end
  else
    nums.each_with_index do |num, i|
      (([0, i - k].max)...(i)).each do |j|
        if nums[j] - num <= t && nums[j] - num >= -t
          #puts "i=#{i}, j=#{j}"
          return true
        end
      end
    end
  end

  false
end
