# @param {Integer} num
# @return {Boolean}
def is_ugly(num)
  return true if num == 1
  return false if num <= 0
  [2,3,5].each do |i|
    while num % i == 0 do
      num /= i
    end
  end

  return num == 1
end
