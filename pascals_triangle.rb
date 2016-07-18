# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  return [] if num_rows == 0

  pascals_triangle = [[1]]

  while pascals_triangle.length < num_rows do
    new_row = [1]
    pascals_triangle.last.each_with_index do |ele, i|
      if i + 1 < pascals_triangle.last.length
        new_row << ele + pascals_triangle.last[i+1]
      end
    end
    new_row << 1
    pascals_triangle << new_row
  end

  pascals_triangle
end
