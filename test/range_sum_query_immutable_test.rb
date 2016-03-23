require 'minitest/autorun'
require '../range_sum_query_immutable'

describe 'NumArray' do
  it 'should work1' do
    nums = [-2, 0, 3, -5, 2, -1]
    num_array = NumArray.new nums

    num_array.sum_range(0, 2).must_equal(1)
    num_array.sum_range(2, 5).must_equal(-1)
    num_array.sum_range(0, 5).must_equal(-3)

    nums = []
    num_array = NumArray.new nums

    num_array.sum_range(0, 2).must_equal(0)
  end
end
