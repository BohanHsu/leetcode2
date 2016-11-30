# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  arr = []
  cur_height = 0
  last_i = 0
  height.each_with_index do |h, i|
    if h >= cur_height
      arr << [cur_height, i]
      cur_height = h
      last_i = i
    end
  end

  arr2 = []
  cur_height = height[-1]

  #puts "last_i=#{last_i}"
  (0...height.length - 1 - last_i).each do |i|
    #puts "shabi"
    if height[height.length-i-1] >= cur_height
      cur_height = height[height.length-i-1]
      arr2 << [cur_height, height.length-i-1]
    end
  end
  #puts "arr=#{arr}"

  arr = arr + arr2.reverse

  #puts "arr=#{arr}"

  nums = []

  (0...(arr.length-1)).each do |i|
    (arr[i+1][1] - arr[i][1]).times do
      nums << arr[i+1][0]
    end
  end

  #puts "nums=#{nums}"
  buffer = []
  max_contaier = 0

  nums.each_with_index do |n, i|
    j = buffer.length - 1
    while !buffer.empty? && j >= 0 && nums[buffer[j]] > n do
      j -= 1
    end
    j += 1
    (j...buffer.length).each do |k|
      max_contaier = [nums[buffer[k]] * (i-k), max_contaier].max
      #puts "k=#{k}, nums[buffer[k]]=#{nums[buffer[k]]}, nums[k] * (i-k)=#{nums[k] * (i-k)}, max_contaier=#{max_contaier}"
    end
    buffer = buffer[0...j]
    max_contaier = [n * (i-j+1), max_contaier].max
    buffer << i
    #puts "n=#{n}, i=#{i}, buffer=#{buffer}, j=#{j}, max_contaier=#{max_contaier}"
  end

  #puts "buffer=#{buffer}"

  if !buffer.empty?
    max_contaier = [nums[buffer[0]] * (buffer[-1] + 1), max_contaier].max
  end

  while !buffer.empty? do
    j = buffer[-1]
    i = buffer.shift
    #puts "nums[i]=#{nums[i]}, (j-i+1)=#{(j-i+1)}"
    max_contaier = [nums[i] * (j - i + 1), max_contaier].max
  end

  return max_contaier
end
