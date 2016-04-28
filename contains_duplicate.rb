# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  hash = {}
  nums.each do |num|
    if hash.has_key?(num)
      return true
    end
    hash[num] = 0
  end
  false
end
