# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  len1 = word1.length
  len2 = word2.length

  matrix = (len1+1).times.map do
    (len2+1).times.map do
      0
    end
  end

  len1.times do |i|
    matrix[i+1][0] = i + 1
  end

  len2.times do |j|
    matrix[0][j+1] = j + 1
  end

  len1.times do |i|
    len2.times do |j|
      matrix[i+1][j+1] = [matrix[i+1][j]+1, matrix[i][j+1]+1, (matrix[i][j] + (word1[i] == word2[j] ? 0 : 1))].min
    end
  end

  return matrix[len1][len2]
end
