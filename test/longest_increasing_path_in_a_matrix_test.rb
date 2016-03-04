require 'minitest/autorun'
require '../longest_increasing_path_in_a_matrix'

describe 'longest_increasing_path(matrix)' do
  it 'should work1' do
    matrix = [
      [9,9,4],
      [6,6,8],
      [2,1,1]
    ]
    expected_result = 4
    actual_result = longest_increasing_path(matrix)
    actual_result.must_equal(expected_result)

    matrix = [
      [3,4,5],
      [3,2,6],
      [2,2,1]
    ]
    expected_result = 4
    actual_result = longest_increasing_path(matrix)
    actual_result.must_equal(expected_result)
  end
end

#describe 'longest_increasing_path_from(matrix, i, j)' do
#  it 'shold work1' do
#    matrix = [
#      [1,2,3,4,5],
#      [8,9,8,7,6],
#      [7,6,5,4,3]
#    ]
#    i = 0
#    j = 0
#    expected_result = 9
#    actual_result = longest_increasing_path_from(matrix, i, j)
#    actual_result.must_equal(expected_result)
#
#    i = 2
#    j = 4
#    expected_result = 7
#    actual_result = longest_increasing_path_from(matrix, i, j)
#    actual_result.must_equal(expected_result)
#  end
#end
#
#describe 'get_valid_neighboors(matrix, i ,j)' do
#  it 'should work1' do
#    matrix = [
#      [6,7,8],
#      [7,7,8],
#      [6,9,5]
#    ]
#    i = 1
#    j = 1
#    actual_result = get_valid_neighboors(matrix, i, j).sort
#    expected_result = [[1,2], [2,1]].sort
#    actual_result.must_equal(expected_result)
#
#    i = 2
#    j = 2
#    actual_result = get_valid_neighboors(matrix, i, j).sort
#    expected_result = [[1,2], [2,1]].sort
#    actual_result.must_equal(expected_result)
#
#    i = 0
#    j = 0
#    actual_result = get_valid_neighboors(matrix, i, j).sort
#    expected_result = [[1,0], [0,1]].sort
#    actual_result.must_equal(expected_result)
#  end
#end
