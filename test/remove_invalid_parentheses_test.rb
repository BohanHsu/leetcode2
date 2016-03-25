require 'minitest/autorun'
require '../remove_invalid_parentheses'

describe 'remove_invalid_parentheses(s)' do
  it 'should work1' do
    s = "()())()"
    expected_result = ["()()()", "(())()"]
    actual_result = remove_invalid_parentheses(s)
    actual_result.sort!
    expected_result.sort!
    actual_result.must_equal(expected_result)
  end

  it 'should work2' do
    s = "(a)())()"
    expected_result = ["(a)()()", "(a())()"]
    actual_result = remove_invalid_parentheses(s)
    actual_result.sort!
    expected_result.sort!
    actual_result.must_equal(expected_result)
  end

  it 'should work3' do
    s = ")("
    expected_result = [""]
    actual_result = remove_invalid_parentheses(s)
    actual_result.sort!
    expected_result.sort!
    actual_result.must_equal(expected_result)
  end

  it 'should work4' do
    s = "(a)b)"
    expected_result = ["(a)b", "(ab)"]
    actual_result = remove_invalid_parentheses(s)
    actual_result.sort!
    expected_result.sort!
    actual_result.must_equal(expected_result)
  end

  it 'should work5' do
    s = "(()"
    expected_result = ["()"]
    actual_result = remove_invalid_parentheses(s)
    actual_result.sort!
    expected_result.sort!
    actual_result.must_equal(expected_result)
  end

  it 'should work6' do
    s = "("
    expected_result = [""]
    actual_result = remove_invalid_parentheses(s)
    actual_result.sort!
    expected_result.sort!
    actual_result.must_equal(expected_result)
  end

  it 'should work7' do
    s = "))"
    expected_result = [""]
    actual_result = remove_invalid_parentheses(s)
    actual_result.sort!
    expected_result.sort!
    actual_result.must_equal(expected_result)

    s = "((((("
    expected_result = [""]
    actual_result = remove_invalid_parentheses(s)
    actual_result.sort!
    expected_result.sort!
    actual_result.must_equal(expected_result)
  end

  it 'should work8' do
    s = ")(f"
    expected_result = ["f"]
    actual_result = remove_invalid_parentheses(s)
    actual_result.sort!
    expected_result.sort!
    actual_result.must_equal(expected_result)
  end
end
