# @param {Integer} num
# @return {String}
def int_to_roman(num)
  i = 0
  arr = []
  while num > 0 do 
    arr << convert(i, num % 10)
    num /= 10
    i += 1
  end

  return arr.reverse.join("")
end

def convert(i, d)
  case i
  when 0
    return [
      "",
      "I",
      "II",
      "III",
      "IV",
      "V",
      "VI",
      "VII",
      "VIII",
      "IX"][d]
  when 1
    return [
      "",
      "X",
      "XX",
      "XXX",
      "XL",
      "L",
      "LX",
      "LXX",
      "LXXX",
      "XC"][d]
  when 2
    return [
      "",
      "C",
      "CC",
      "CCC",
      "CD",
      "D",
      "DC",
      "DCC",
      "DCCC",
      "CM"][d]
  when 3
    return "M" * d
  end
end
