# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  max_length = [a.length, b.length].max
  arr = max_length.times.map {0}

  carrier = 0
  (0...max_length).each do |i|
    o1 = nil
    o2 = nil
    if (a.length - 1 - i) >= 0
      o1 = a[a.length - 1 - i].to_i
    else
      o1 = 0
    end

    if (b.length - 1 - i) >= 0
      o2 = b[b.length - 1 - i].to_i
    else
      o2 = 0
    end
    
    digit = (carrier + o1 + o2) % 2
    carrier = (carrier + o1 + o2) / 2

    arr[max_length - 1 - i] = digit
  end
  str = arr.join("")
  if carrier == 1
    str = "1" + str
  end
  return str
end
