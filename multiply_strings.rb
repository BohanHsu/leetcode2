# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
  arr1 = num1.split("").map(&:to_i)
  arr2 = num2.split("").map(&:to_i)
  hsh = {}
  arr2.each do |n|
    if !hsh.has_key?(n) && n != 0
      hsh[n] = arr_mult_num(arr1.clone, n)
    end
  end

  if hsh.has_key?(arr2[arr2.length-1])
    base = hsh[arr2[arr2.length-1]].clone
  else
    base = [0]
  end
  (1...arr2.length).each do |i|
    if arr2[arr2.length-1-i] != 0 && hsh[arr2[arr2.length-1-i]] != [0]
      cur_arr = hsh[arr2[arr2.length-1-i]] + ([0] * i)
      base = arr_add_arr(base, cur_arr)
    end
  end
  return base.join("")
end

def arr_mult_num(arr, n)
  return [0] if n == 0
  carrier = 0
  all_zero = true
  arr.length.times do |i|
    if all_zero && arr[arr.length-1-i] != 0
      all_zero = false
    end
    res = arr[arr.length-1-i] * n + carrier
    carrier = res / 10
    d = res % 10
    arr[arr.length-1-i] = d
  end

  if all_zero
    return [0]
  end

  if carrier > 0
    return [carrier] + arr
  else
    i = 0
    while i < arr.length && arr[i] == 0 do
      i += 1
    end
    arr = arr[i...arr.length]
    return arr
  end
end

def arr_add_arr(arr1, arr2)
  if arr1.length > arr2.length
    long = arr1
    short = arr2
  else
    long = arr2
    short = arr1
  end

  carrier = 0
  long.length.times do |i|
    a = 0
    if i < short.length
      a = short[short.length-1-i]
    end
    b = long[long.length-1-i]
    res = (a+b+carrier)
    carrier = res / 10
    d = res % 10
    long[long.length-1-i] = d
  end

  if carrier > 0
    return [carrier] + long
  else
    return long.clone
  end
end
