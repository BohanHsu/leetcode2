require 'minitest/autorun'
require '../basic_calculator'

describe 'calculate(s)' do
  it 'should work1' do
    s = "1 + 1"
    expected_result = 2
    calculate(s).must_equal(expected_result)

    s = " 2-1 + 2 "
    expected_result = 3
    calculate(s).must_equal(expected_result)
  end

  it 'should work2' do
    s = "(1+(4+5+2)-3)+(6+8)"
    expected_result = 23
    calculate(s).must_equal(expected_result)
  end

  it 'should work3' do
    s = "(2134  +32) - (432 * 43) - 1 *  3 - 2 -200"
    actual_result = calculate(s)
    expected_result = eval(s)
    actual_result.must_equal(expected_result)

    s = "0"
    actual_result = calculate(s)
    expected_result = eval(s)
    actual_result.must_equal(expected_result)
  end
end
