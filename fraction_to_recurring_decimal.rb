# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
  integer = numerator / denominator
  numerator -= (integer * denominator)
  buffer = []
  indices = {}

  while numerator != 0 do
    numerator *= 10
    while numerator < denominator do
      buffer << 0
      numerator *= 10
    end

    break if indices.has_key?(numerator)

    indices[numerator] = buffer.length - 1
    buffer << numerator / denominator
    numerator = numerator % denominator
  end

  if numerator == 0
    str = integer + "." + buffer.join("")
  else
    str = integer + "."
    idx = indices[numerator]
    if idx != 0
      str += buffer[0...idx].join("")
    end
    str = str + "(" + buffer[idx...buffer.length].join("") + ")"
  end
  str
end
