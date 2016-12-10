require 'minitest/autorun'
require '../generate_parentheses'

describe 'generate_parenthesis(n)' do
  it 'should work1' do
    n = 3
    expected_result = [
      "((()))",
      "(()())",
      "(())()",
      "()(())",
      "()()()"
    ]
    generate_parenthesis(n).sort.must_equal(expected_result.sort)
    
    n = 0
    expected_result = []
    generate_parenthesis(n).sort.must_equal(expected_result.sort)

    n = 1
    expected_result = ["()"]
    generate_parenthesis(n).sort.must_equal(expected_result.sort)

    n = 2
    expected_result = ["()()", "(())"]
    generate_parenthesis(n).sort.must_equal(expected_result.sort)
  end
end
