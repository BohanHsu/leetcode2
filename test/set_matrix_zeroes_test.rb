require 'minitest/autorun'
require '../set_matrix_zeroes'

describe 'set_zeroes(matrix)' do
  it 'should work1' do
    matrix = [
      [1,2,3,4,0,6,7,8],
      [1,2,3,4,5,6,7,8],
      [1,2,0,4,5,6,7,8],
      [1,2,3,4,5,6,7,8],
      [1,2,3,4,5,6,7,0]
    ]
    expected_result = [
      [0,0,0,0,0,0,0,0],
      [1,2,0,4,0,6,7,0],
      [0,0,0,0,0,0,0,0],
      [1,2,0,4,0,6,7,0],
      [0,0,0,0,0,0,0,0]
    ]
    set_zeroes(matrix)
    matrix.must_equal(expected_result)

    matrix = [
      [1,2]
    ]
    expected_result = [
      [1,2]
    ]
    set_zeroes(matrix)
    matrix.must_equal(expected_result)
  end
end
