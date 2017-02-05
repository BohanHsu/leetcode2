require 'minitest/autorun'
require '../counting_bits'

describe 'count_bits(num)' do
  it 'should work1' do
    num = 5
    expected_result = [0,1,1,2,1,2]
    count_bits(num).must_equal(expected_result)

    num = 6
    expected_result = [0,1,1,2,1,2,2]
    count_bits(num).must_equal(expected_result)
  end

  it 'should work2' do
    num = 4
    expected_result = [0,1,1,2,1]
    count_bits(num).must_equal(expected_result)
  end
end
