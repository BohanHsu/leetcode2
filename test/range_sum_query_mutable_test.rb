require 'minitest/autorun'
require '../range_sum_query_mutable'

describe 'NumArray' do
  before(:each) do
    @num_array = NumArray.new([1,2,3,4,5,6,7,8])
  end

  it 'should work1' do
    @num_array.sum_range(0,0).must_equal(1)
    @num_array.sum_range(2,5).must_equal(18)
  end

  it 'should work1' do
    @num_array.update(0, 2)
    @num_array.sum_range(0,0).must_equal(2)
    @num_array.sum_range(0,7).must_equal(37)
  end
end
