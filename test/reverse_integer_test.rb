require 'minitest/autorun'
require '../reverse_integer'

describe 'reverse(x)' do
  it 'should work1' do
    x = 1234
    expected_result = 4321
    reverse(x).must_equal(expected_result)

    x = 100000
    expected_result = 1
    reverse(x).must_equal(expected_result)

    x = -1234
    expected_result = -4321
    reverse(x).must_equal(expected_result)

    x = 1534236469
    expected_result = 0
    reverse(x).must_equal(expected_result)

    x = -1534236469
    expected_result = 0
    reverse(x).must_equal(expected_result)
  end
end
