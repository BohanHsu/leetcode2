require 'minitest/autorun'
require '../integer_to_roman'

describe 'int_to_roman(num)' do
  it 'should work1' do
    num = 1
    expected_result = "I"
    int_to_roman(num).must_equal(expected_result)

    num = 12
    expected_result = "XII"
    int_to_roman(num).must_equal(expected_result)

    num = 123
    expected_result = "CXXIII"
    int_to_roman(num).must_equal(expected_result)

    num = 1234
    expected_result = "MCCXXXIV"
    int_to_roman(num).must_equal(expected_result)

    num = 3421
    expected_result = "MMMCDXXI"
    int_to_roman(num).must_equal(expected_result)

    num = 321
    expected_result = "CCCXXI"
    int_to_roman(num).must_equal(expected_result)

    num = 32
    expected_result = "XXXII"
    int_to_roman(num).must_equal(expected_result)
  end
end
