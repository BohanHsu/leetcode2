require 'minitest/autorun'
require '../spiral_matrix'

describe 'spiral_order(matrix)' do
  it 'should work1' do
    matrix = [
      [ 1, 2, 3 ],
      [ 4, 5, 6 ],
      [ 7, 8, 9 ]
    ]
    expected_result = [1,2,3,6,9,8,7,4,5]
    spiral_order(matrix).must_equal(expected_result)

    matrix = [[2,3,4]]
    expected_result = [2,3,4]
    spiral_order(matrix).must_equal(expected_result)

    matrix = [[2],[3]]
    expected_result = [2,3]
    spiral_order(matrix).must_equal(expected_result)
  end

  it 'should work2' do
  end
end
