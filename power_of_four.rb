# @param {Integer} num
# @return {Boolean}
def is_power_of_four(num)
  return false if num <= 0
  binary_array = num.to_s(2).chars
  (1...binary_array.length).each do |i|
    return false if binary_array[i] == "1"
  end
  return binary_array.length % 2 == 1
end
