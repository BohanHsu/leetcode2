require 'minitest/autorun'
require '../string_to_integer'

describe 'my_atoi(str)' do
  it 'should work1' do
    str = "123"
    expected_result = 123
    my_atoi(str).must_equal(expected_result)
    
    str = "   123"
    expected_result = 123
    my_atoi(str).must_equal(expected_result)

    str = " \n  123"
    expected_result = 123
    my_atoi(str).must_equal(expected_result)

    str = "   +123"
    expected_result = 123
    my_atoi(str).must_equal(expected_result)

    str = "   -123"
    expected_result = -123
    my_atoi(str).must_equal(expected_result)

    str = "123abc"
    expected_result = 123
    my_atoi(str).must_equal(expected_result)

    str = "123abc+r+"
    expected_result = 123
    my_atoi(str).must_equal(expected_result)

    str = "123abc1"
    expected_result = 123
    my_atoi(str).must_equal(expected_result)
    
    str = "abc1"
    expected_result = 0
    my_atoi(str).must_equal(expected_result)

    str = "a"
    expected_result = 0
    my_atoi(str).must_equal(expected_result)

    str = "2147483648"
    expected_result = 2147483647
    my_atoi(str).must_equal(expected_result)

    str = "-2147483649"
    expected_result = -2147483648
    my_atoi(str).must_equal(expected_result)

    str = ""
    expected_result = 0
    my_atoi(str).must_equal(expected_result)
  end

  it 'should work2' do
    str = "  -0012a42"
    expected_result = -12
    my_atoi(str).must_equal(expected_result)
  end
end
