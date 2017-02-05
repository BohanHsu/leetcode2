# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
  result = [0, 1, 1, 2]

  while result.length < num + 1 do
    copy_result = result.map do |n|
      n + 1
    end
    result = result + copy_result
  end

  return result[0..num]

end
