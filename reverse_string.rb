# @param {String} s
# @return {String}
def reverse_string(s)
  arr = s.chars
  i = 0
  j = arr.length - 1
  while i < j do
    tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
    i += 1
    j -= 1
  end

  return arr.join("")
end
