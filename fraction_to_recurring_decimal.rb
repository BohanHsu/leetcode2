# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
  return "0" if numerator == 0
  sign = true
  sign = !sign if numerator < 0
  numerator = -numerator if numerator < 0
  sign = !sign if denominator < 0
  denominator = -denominator if denominator < 0

  integer = numerator / denominator
  return (sign ? "" : "-") + "#{integer}" if numerator % denominator == 0
  numerator -= (integer * denominator)
  buffer = []
  indices = {}

  while numerator != 0 do
    numerator *= 10
    while numerator < denominator do
      break if indices.has_key?(numerator)
      buffer << 0
      indices[numerator] = buffer.length - 1
      numerator *= 10
    end

    #puts "numerator=#{numerator}, denominator=#{denominator}, indices=#{indices}"

    break if indices.has_key?(numerator)
    buffer << numerator / denominator
    indices[numerator] = buffer.length - 1
    numerator = numerator % denominator
  end

  if numerator == 0
    str = "#{integer}." + buffer.join("")
  else
    str = "#{integer}."
    idx = indices[numerator]
    if idx != 0
      str += buffer[0...idx].join("")
    end
    str = str + "(" + buffer[idx...buffer.length].join("") + ")"
  end
  return (sign ? "" : "-") + str
end
