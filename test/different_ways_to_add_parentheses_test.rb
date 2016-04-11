require 'minitest/autorun'
require '../different_ways_to_add_parentheses'

describe 'diff_ways_to_compute(input)' do
  it 'should work2' do
    input = "2*3-4*5"
    expected_result = [-34, -14, -10, -10, 10]
    diff_ways_to_compute(input).sort.must_equal(expected_result.sort)

    input = "2-1-1"
    expected_result = [0, 2]
    diff_ways_to_compute(input).sort.must_equal(expected_result.sort)

    input = "2"
    expected_result = [2]
    diff_ways_to_compute(input).sort.must_equal(expected_result.sort)

    input = ""
    expected_result = []
    diff_ways_to_compute(input).sort.must_equal(expected_result.sort)
  end

  it 'should work3' do
    input = "11"
    expected_result = [11]
    diff_ways_to_compute(input).sort.must_equal(expected_result.sort)
  end
end

describe 'expression_pattern_to_expr(expression, target)' do
  it 'should work1' do
    target = "2*3-4*5"
    expression = "((?#?)#(?#?))"
    expected_result = "((2*3)-(4*5))"
    expression_pattern_to_expr(expression, target).must_equal(expected_result)
  end
end
