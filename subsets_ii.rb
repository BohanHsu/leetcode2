# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
  return [[]] if nums.empty?
  nums.sort!
  hsh = {}
  result =  subsets_with_dup_helper(nums, hsh) << []
  #puts hsh
  return result
end

def subsets_with_dup_helper(nums, hsh)
  if nums.length == 1
    if !hsh.has_key?(nums[0].to_s)
      hsh[nums[0].to_s] = true
    end
    return [nums.clone]
  else
    subset_part = []
    known_part = subsets_with_dup_helper(nums[1...nums.length], hsh)
    if !hsh.has_key?(nums[0].to_s)
      subset_part << [nums[0]]
      hsh[nums[0].to_s] = true
    end

    known_part.each do |set|
      str = ([nums[0]] + set).join(" ")
      if !hsh.has_key?(str)
        subset_part << ([nums[0]] + set)
        hsh[str] = true
      end
    end
    #puts "====="
    #puts "nums=#{nums}\nhsh=#{hsh}\nresult=#{subset_part + known_part}"

    return subset_part + known_part
  end
end
