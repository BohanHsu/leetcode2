# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  # let assume single item is not a range
  single_dog = true
  return [] if nums.empty?
  results = []

  start = 0
  i = 1

  while i < nums.length do
    if nums[i] == nums[i-1] + 1
      i += 1
    else
      if single_dog 
        if nums[start] < nums[i-1]
          results << "#{nums[start]}->#{nums[i-1]}"
        else
          results << "#{nums[start]}"
        end
      else
        results << "#{nums[start]}->#{nums[i-1]}"
      end
      start = i
      i = start + 1
    end
  end

  if single_dog
    if nums[start] < nums[i-1]
      results << "#{nums[start]}->#{nums[i-1]}"
    else
      results << "#{nums[start]}"
    end
  else
    results << "#{nums[start]}->#{nums[i-1]}"
  end

  results
end
