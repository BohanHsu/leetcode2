# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  num = nil
  num_count = 0

  nums.each do |n|
    if num_count == 0
      num = n
      num_count = 1
    elsif num == n
      num_count += 1
    else
      num_count -= 1
    end
  end

  num
end
