require 'minitest/autorun'
require '../longest_valid_parentheses'

describe 'longest_valid_parentheses(s)' do
  it 'should work1' do
    s = '(()'
    expected_result = 2
    longest_valid_parentheses(s).must_equal(expected_result)

    s = ')()())'
    expected_result = 4
    longest_valid_parentheses(s).must_equal(expected_result)

    s = '()'
    expected_result = 2
    longest_valid_parentheses(s).must_equal(expected_result)
  end

  it 'should work2' do
    s = ')()())()()('
    expected_result = 4
    longest_valid_parentheses(s).must_equal(expected_result)
  end
end
