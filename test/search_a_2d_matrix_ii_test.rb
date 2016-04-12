require 'minitest/autorun'
require '../search_a_2d_matrix_ii'

describe 'search_matrix(matrix, target)' do
  it 'should work1' do
    matrix = [
      [1, 4, 7, 11, 15],
      [2, 5, 8, 12, 19],
      [3, 6, 9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    exists = matrix.inject do |memo, obj|
      memo + obj
    end
    ((exists[0] - 1)..(exists[-1] + 1)).each do |i|
      search_matrix(matrix, i).must_equal(!exists.find_index(i).nil?)
    end
  end

  it 'should work2' do
    matrix = [[]]
    [1,2,3,4].each do |i|
      search_matrix(matrix, i).must_equal(false)
    end
  end
end 
