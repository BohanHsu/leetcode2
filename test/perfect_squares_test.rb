require 'minitest/autorun'
require '../perfect_squares'

describe 'num_squares(n)' do
  it 'should work1' do
    n = 12
    expected_result = 3
    num_squares(n).must_equal(expected_result)

    n = 13
    expected_result = 2
    num_squares(n).must_equal(expected_result)

    n = 1
    expected_result = 1
    num_squares(n).must_equal(expected_result)

    n = 0
    expected_result = 1
    num_squares(n).must_equal(expected_result)
  end

  it 'should work2' do
    n = 7691
    expected_result = 3
    num_squares(n).must_equal(expected_result)

    n = 6730
    expected_result = 2
    num_squares(n).must_equal(expected_result)
  end
end
