# @param {String} num
# @return {Boolean}
def is_additive_number(num)
  stack = [[0,0]]
  i = stack[-1][1]

  while stack[-1][1] != num.length - 1 do
    #puts "stack=#{stack}"
    match_flag = false
    (i+1..(num.length - 1 - i) / 2 + i + 1) .each do |j|
      #puts "num1=#{num[stack[-1][0]..stack[-1][1]].to_i}, num2=#{num[i+1..j].to_i}"
      cur_sum = (num[stack[-1][0]..stack[-1][1]].to_i + num[i+1..j].to_i).to_s
      cur_sum_length = cur_sum.length
      #puts "next=#{num[j+1..j+cur_sum_length]}, cur_sum=#{cur_sum}"

      if num[j+1..j+cur_sum_length] == cur_sum
        stack << [i+1, j]
        match_flag = true
        return true if j + cur_sum_length == num.length - 1
        break
      end
    end

    if match_flag
      i = stack[-1][1]
    else
      stack[-1][1] += 1

      while stack[-1][1] - stack[-1][0] + 1 > num.length - 1 - stack[-1][1] do
        stack.pop
        return false if stack.empty?
        stack[-1][1] += 1
      end
    end
  end
  true
end
