require 'minitest/autorun'
require '../range_sum_query_2D_immutable'

describe 'NumMatrix' do
  before(:each) do
    @matrix = [
      [3, 0, 1, 4, 2],
      [5, 6, 3, 2, 1],
      [1, 2, 0, 1, 5],
      [4, 1, 0, 1, 7],
      [1, 0, 3, 0, 5]
    ]

    @num_matrix = NumMatrix.new @matrix
  end

  it 'should work1' do
    @num_matrix.sum_region(2, 1, 4, 3).must_equal(8)
    @num_matrix.sum_region(1, 1, 2, 2).must_equal(11)
    @num_matrix.sum_region(1, 2, 2, 4).must_equal(12)
  end

  it 'should work for corner case' do
    num_matrix = NumMatrix.new []
    num_matrix.sum_region(1, 2, 2, 4).must_equal(0)
  end
end
