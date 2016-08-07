# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  #puts "s1=#{s1}, s2=#{s2}, s3=#{s3}"
  return false if s1.length + s2.length != s3.length

  matrix = (s1.length+1).times.map {(s2.length+1).times.map {false}}
  matrix[0][0] = true

  (1..s1.length).each do |i|
    if matrix[i-1][0] && s1[i-1] == s3[i-1]
      matrix[i][0] = true
    end
  end

  (1..s2.length).each do |j|
    if matrix[0][j-1] && s2[j-1] == s3[j-1]
      matrix[0][j] = true
    end
  end

  (1..s1.length).each do |i|
    (1..s2.length).each do |j|
      matrix[i][j] = matrix[i-1][j] && s3[i+j-1] == s1[i-1] || matrix[i][j-1] && s3[i+j-1] == s2[j-1]
    end
  end

  return matrix[s1.length][s2.length]
end
