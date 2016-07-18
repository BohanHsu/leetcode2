require 'minitest/autorun'
require '../pascals_triangle_ii'

describe 'get_row(row_index)' do
  it 'should work1' do
    pascals_triangle = [
      [1],
      [1,1],
      [1,2,1],
      [1,3,3,1],
      [1,4,6,4,1]
    ]

    (0..4).each do |i|
      get_row(i).must_equal(pascals_triangle[i])
    end
  end
end
