# @param {Integer[][]} triangle
# @return {Integer}
def minimum_total(triangle)
  return 0 if triangle.nil? || triangle.empty?

  sums = triangle.map {|r| 0}
  cur_sums = triangle.map {|r| 0}

  triangle.each_with_index do |row, i|
    if i == 0
      sums[0] = row[0]
    else
      row.each_with_index do |ele, i|
        if i == 0
          cur_sums[i] = ele + sums[0]
        elsif i == row.length - 1
          cur_sums[i] = ele + sums[i-1]
        else
          cur_sums[i] = ele + [sums[i], sums[i-1]].min
        end
      end

      row.each_with_index do |ele, i|
        sums[i] = cur_sums[i]
        cur_sums[i] = 0
      end
    end
  end
  sums.min
end
