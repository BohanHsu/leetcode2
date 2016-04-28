# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  hash = {}
  nums.each_with_index do |num, i|
    if hash.has_key?(num) && i - hash[num] <= k
      return true
    end
    hash[num] = i
  end
  false
end
