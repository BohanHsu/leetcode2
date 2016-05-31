require 'minitest/autorun'
require '../number_of_1_bits'

describe 'hamming_weight(n)' do
  it 'should work1' do
    n = 1
    expected_result = 1
    hamming_weight(n).must_equal(expected_result)

    n = 2
    expected_result = 1
    hamming_weight(n).must_equal(expected_result)

    n = 4
    expected_result = 1
    hamming_weight(n).must_equal(expected_result)

    n = 6
    expected_result = 2
    hamming_weight(n).must_equal(expected_result)

    n = 18
    expected_result = 2
    hamming_weight(n).must_equal(expected_result)
  end
end
