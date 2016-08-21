require 'minitest/autorun'
require '../unique_paths'

describe 'unique_paths(m, n)' do
  it 'should work1' do
    m = 7
    n = 3
    unique_paths(m, n).must_equal(cal_expected_result(m, n))
  end
end

def cal_expected_result(n,m)
  matrix = m.times.map do
    n.times.map do
      1
    end
  end

  (1...m).each do |i|
    (1...n).each do |j|
      matrix[i][j] = matrix[i-1][j] + matrix[i][j-1]
    end
  end

  return matrix[m-1][n-1]
end
