# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k)
  mod = (1..n).each.inject(1) do |memo, obj|
    memo * obj
  end
  buffer = []
  used = {}

  while buffer.length < n do
    mod /= (n - buffer.length)
    base = (k - 1) / mod + 1
    offset = 0

    j = 1
    while j <= (base + offset) do
      offset += 1 if used.has_key?(j)
      j += 1
    end

    digit = base + offset
    used[digit] = true
    buffer << digit
    k = (k % mod == 0 ? mod : k % mod)
  end

  return buffer.join("")
end


# 1
# 
# 12
# 21
# 
# 123
# 132
# 213
# 231
# 312
# 321
# 
# 1234
# 1243
# 1324
# 1342
# 1423
# 1432
# 2134
# 2143
# 2314
# 2341
# 2413
# 2431
# 3124
# 3142
# 3214
# 3241
# 3412
# 3421
# 4123
# 4132
# 4213
# 4231
# 4312
# 4321
