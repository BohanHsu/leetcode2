# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
  uglys = [1,2,3,4,5]
  hsh = {2 => 1, 3 => 0, 5 => 0}

  while uglys.length < n do
    next_ugly = [
      2 * uglys[hsh[2] + 1], 
      3 * uglys[hsh[3] + 1], 
      5 * uglys[hsh[5] + 1]
    ].min

    hsh[2] = find_index_of_num(uglys, hsh[2], next_ugly / 2) if next_ugly % 2 == 0
    hsh[3] = find_index_of_num(uglys, hsh[3], next_ugly / 3) if next_ugly % 3 == 0
    hsh[5] = find_index_of_num(uglys, hsh[5], next_ugly / 5) if next_ugly % 5 == 0
    uglys << next_ugly
  end

  return uglys[n-1]
end

def find_index_of_num(array, from, target)
  while array[from] != target do
    from += 1
  end
  return from
end
