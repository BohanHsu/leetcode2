require 'minitest/autorun'
require '../expression_add_operators'

describe 'add_operators(num, target)' do
  it 'should work on given examples' do
    num, target, expected_result = ["123", 6, ["1+2+3", "1*2*3"]]
    add_operators(num, target).sort.must_equal(expected_result.sort)
    num, target, expected_result = ["232", 8, ["2*3+2", "2+3*2"]]
    add_operators(num, target).sort.must_equal(expected_result.sort)
    num, target, expected_result = ["105", 5, ["1*0+5","10-5"]]
    add_operators(num, target).sort.must_equal(expected_result.sort)
    num, target, expected_result = ["00", 0, ["0+0", "0-0", "0*0"]]
    add_operators(num, target).sort.must_equal(expected_result.sort)
    num, target, expected_result = ["3456237490", 9191, []]
    add_operators(num, target).sort.must_equal(expected_result.sort)
  end
end
