require 'minitest/autorun'
require '../rotate_image'

describe 'rotate(matrix)' do
  it 'should work1' do
    matrix = [[1]]
    expected_result = [[1]]
    rotate(matrix)
    matrix.must_equal(expected_result)
    
    matrix = [
      [1,2],
      [3,4]
    ]
    expected_result = [
      [3,1],
      [4,2]
    ]
    rotate(matrix)
    matrix.must_equal(expected_result)

    matrix = [
      [1,2,3],
      [4,5,6],
      [7,8,9]
    ]
    expected_result = [
      [7,4,1],
      [8,5,2],
      [9,6,3]
    ]
    rotate(matrix)
    matrix.must_equal(expected_result)
  end

  it 'should work2' do
    matrix = [
      [1,2,3,4],
      [5,6,7,8],
      [9,10,11,12],
      [13,14,15,16]
    ]
    expected_result = [
      [13,9,5,1],
      [14,10,6,2],
      [15,11,7,3],
      [16,12,8,4],
    ]
    rotate(matrix)
    matrix.must_equal(expected_result)
  end
end
