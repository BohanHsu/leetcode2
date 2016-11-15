# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows == 1
  elems_in_row = (0...num_rows).each.map do |j|
    num_of_element_in_row(j, s.length, num_rows)
  end
  elems_before_row = elems_in_row
  (1...num_rows).each do |k|
    elems_before_row[k] = elems_before_row[k-1] + elems_before_row[k]
  end
  elems_before_row = [0] + elems_before_row

  new_str_arr = s.length.times.map {nil}
  s.chars.each_with_index do |chr, n|
    i, j = old_index_to_coordinate(n, num_rows)
    new_index = coordinate_to_new_index(i, j, num_rows, elems_before_row)
    new_str_arr[new_index] = chr
  end
  return new_str_arr.join("")
end

def coordinate_to_new_index(i, j, num_rows, elems_before_row)
  in_row = 0
  if i == 0 || i == num_rows-1
    in_row = j / (num_rows-1)
  else
    if j % (num_rows-1) == 0
      in_row = j / (num_rows-1) * 2
    else
      in_row = j / (num_rows-1) * 2 + 1
    end
  end

  return elems_before_row[i] + in_row
end

def old_index_to_coordinate(n, num_rows)
  interval = num_rows * 2 - 2
  i = -1
  j = -1
  
  if (n % interval) < num_rows
    i = n % interval
    j = n / interval * (num_rows - 1)
  else
    i = num_rows - 1 - (n % interval - num_rows) - 1
    j = n / interval * (num_rows - 1) + (n % interval - num_rows+1)
  end

  return [i, j]
end

def num_of_element_in_row(j, len, num_rows)
  interval = num_rows * 2 - 2
  intact = len / interval 
  partial = len % interval
  if j == 0
    return intact + (partial > 0 ? 1 : 0)
  end
  if j == num_rows - 1
    return intact + (partial >= num_rows ? 1 : 0)
  end

  if partial < num_rows 
    if partial >= j + 1
      return 2 * intact + 1
    else
      return 2 * intact
    end
  else
    #num_rows - 1 - (partial - num_rows)
    if j >= num_rows - 1 - (partial - num_rows)
     return 2 * intact + 2
    else
      return 2 * intact + 1
    end
  end
end
