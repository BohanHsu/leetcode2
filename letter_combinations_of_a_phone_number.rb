# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.length == 0
  dict = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"].map do |str|
    str.split("")
  end

  digits = digits.chars.map do |chr|
    chr.ord - "0".ord
  end

  digits.select! do |digit|
    digit > 1
  end

  multiple = digits.inject(1) do |memo, obj|
    memo * dict[obj].length
  end

  result = multiple.times.map {[]}

  i = 0
  while i < digits.length do 
    multiple /= dict[digits[i]].length
    j = 0
    while j < result.length do
      dict[digits[i]].each do |letter|
        multiple.times do
          result[j] << letter
          j += 1
        end
      end
    end
    i += 1
  end
  return result.map do |res|
    res.join("")
  end
end
