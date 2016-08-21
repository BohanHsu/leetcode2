require 'minitest/autorun'
require '../valid_number'

describe 'is_number(s)' do
  it 'should work1' do
    s = "0"
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = " 0.1 "
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = "abc"
    expected_result = false
    is_number(s).must_equal(expected_result)

    s = "1 a"
    expected_result = false
    is_number(s).must_equal(expected_result)

    s = "2e10"
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = ".10"
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = "10."
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = "10.000"
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = "10..000"
    expected_result = false
    is_number(s).must_equal(expected_result)

    s = "10. 000"
    expected_result = false
    is_number(s).must_equal(expected_result)

    s = "1 0.000"
    expected_result = false
    is_number(s).must_equal(expected_result)

    s = "10.00 0"
    expected_result = false
    is_number(s).must_equal(expected_result)

    s = "       "
    expected_result = false
    is_number(s).must_equal(expected_result)

    s = " .9"
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = "-1."
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = "+1."
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = "+.8"
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = "e9"
    expected_result = false
    is_number(s).must_equal(expected_result)

    s = "46.e9"
    expected_result = true
    is_number(s).must_equal(expected_result)

    s = "46.2e9"
    expected_result = true
    is_number(s).must_equal(expected_result)
  end

  it 'should work2' do
    s = " 005047e+6"
    expected_result = true
    is_number(s).must_equal(expected_result)
    
  end
end
