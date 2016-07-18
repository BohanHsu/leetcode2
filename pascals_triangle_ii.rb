# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  idx = 1
  buffer = (row_index+1).times.map {|i| 0}
  row = (row_index+1).times.map {|i| 0}
  row[0] = 1

  while idx <= row_index do
    buffer[0] = 1
    buffer[idx] = 1
    (1...(idx)).each do |i|
      buffer[i] = row[i] + row[i-1]
    end
    (0..idx).each do |i|
      row[i] = buffer[i]
      buffer[i] = 0
    end
    idx += 1
  end

  return row
end
