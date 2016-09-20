# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  return 0 if nums.empty?
  buffer = nums.map {0}
  j = 0
  nums.each_with_index do |num, i|
    if (i + num) > j
      ((j+1)..(i+num)).each do |k|
        if k < buffer.length
          buffer[k] = buffer[i] + 1
        end
      end
      j = i + num
    end
    return buffer[-1] if j >= buffer.length
  end
  return buffer[-1]
end
