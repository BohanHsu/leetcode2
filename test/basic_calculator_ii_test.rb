require 'minitest/autorun'
require '../basic_calculator_ii'

describe 'calculate(s)' do
  it 'should work1' do
    s = "3+2*2"
    expected_result = 7
    calculate(s).must_equal(expected_result)

    s = " 3/2 "
    expected_result  = 1
    calculate(s).must_equal(expected_result)

    s = " 3+5 / 2 "
    expected_result  = 5
    calculate(s).must_equal(expected_result)
  end
end
