require 'minitest/autorun'
require '../spiral_matrix_ii'

describe 'generate_matrix(n)' do
  it 'should work1' do
    n = 1
    expected_result = [
      [1]
    ]
    generate_matrix(n).must_equal(expected_result)

    n = 2
    expected_result = [
      [ 1, 2 ],
      [ 4, 3 ],
    ]
    generate_matrix(n).must_equal(expected_result)

    n = 3
    expected_result = [
      [ 1, 2, 3 ],
      [ 8, 9, 4 ],
      [ 7, 6, 5 ]
    ]
    generate_matrix(n).must_equal(expected_result)
  end
end

