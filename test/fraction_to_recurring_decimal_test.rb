require 'minitest/autorun'
require '../fraction_to_recurring_decimal'

describe 'fraction_to_decimal(numerator, denominator)' do
  it 'should work1' do
    numerator = 1
    denominator = 2
    expected_result = "0.5"
    fraction_to_decimal(numerator, denominator).must_equal(expected_result)

    numerator = 2
    denominator = 1
    expected_result = "2"
    fraction_to_decimal(numerator, denominator).must_equal(expected_result)

    numerator = 2
    denominator = 3
    expected_result = "0.(6)"
    fraction_to_decimal(numerator, denominator).must_equal(expected_result)
  end

  it 'should work2' do
    numerator = 1
    denominator = 7
    expected_result = "0.(142857)"
    fraction_to_decimal(numerator, denominator).must_equal(expected_result)
  end
  
  it 'should work3' do
    numerator = -7
    denominator = 12
    expected_result = "-0.58(3)"
    fraction_to_decimal(numerator, denominator).must_equal(expected_result)

    numerator = -7
    denominator = 1
    expected_result = "-7"
    fraction_to_decimal(numerator, denominator).must_equal(expected_result)
  end

  it 'should work4' do
    numerator = 1
    denominator = 99
    expected_result = "0.(01)"
    fraction_to_decimal(numerator, denominator).must_equal(expected_result)
  end

  it 'should work4' do
    numerator = 0
    denominator = -5
    expected_result = "0"
    fraction_to_decimal(numerator, denominator).must_equal(expected_result)
  end
end
