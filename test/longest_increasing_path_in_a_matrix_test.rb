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
