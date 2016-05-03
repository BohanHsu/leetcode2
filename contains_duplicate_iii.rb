# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer} t
# @return {Boolean}
def contains_nearby_almost_duplicate(nums, k, t)
  hash = {}
  if k > t
    # using t
    nums.each_with_index do |num, i|
      ((num - t)..(num + t)).each do |j|

      end
    end
  else

  end
end
