# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  cur_max = 0
  hsh = {}

  nums.each do |num|
    hsh[num] = true
  end

  while hsh.size > 0 do
    num = pick_one(hsh)
    hsh.delete(num)
    count = 1

    j = 1
    while hsh.has_key?(num+j) do
      hsh.delete(num+j)
      count += 1
      j += 1
    end

    j = 1
    while hsh.has_key?(num-j) do
      hsh.delete(num-j)
      count += 1
      j += 1
    end

    cur_max = [cur_max, count].max
  end

  cur_max
end

def pick_one(hsh)
  return hsh.keys[0]
end
