# @param {Integer[]} nums
# @return {Integer[]}
def majority_element(nums)
  num1 = nil
  num2 = nil
  num1_count = 0
  num2_count = 0

  nums.each do |n|
    if num1_count == 0 && n != num2
      num1 = n
      num1_count = 1
    elsif n == num1
      num1_count += 1
    elsif num2_count == 0
      num2 = n
      num2_count += 1
    elsif n == num2
      num2_count += 1
    else
      num1_count -= 1
      num2_count -= 1
    end
    #puts "n=#{n}, num1=#{num1}, num1_count=#{num1_count}, num2=#{num2}, num2_count=#{num2_count}"
  end

  results = []

  num1_len = nums.select do |n|
    n == num1
  end.length

  num2_len = nums.select do |n|
    n == num2
  end.length

  results << num1 if num1_len > nums.length / 3
  results << num2 if num2_len > nums.length / 3 && num1 != num2

  #puts "num1=#{num1}, num1_len=#{num1_len}, num2=#{num2}, num2_len=#{num2_len}, nums.length / 3=#{nums.length / 3}"

  results
end
