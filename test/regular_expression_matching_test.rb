require 'minitest/autorun'
require '../regular_expression_matching'

describe 'is_match(s, p)' do
  it 'should work1' do
    s = "aab"
    p = "c*a*b"
    expected_result = true
    is_match(s, p).must_equal(expected_result)

    s = "aa"
    p = "a"
    expected_result = false
    is_match(s, p).must_equal(expected_result)

    s = "aa"
    p = "aa"
    expected_result = true
    is_match(s, p).must_equal(expected_result)

    s = "aaa"
    p = "aa"
    expected_result = false
    is_match(s, p).must_equal(expected_result)

    s = "aa"
    p = "a*"
    expected_result = true
    is_match(s, p).must_equal(expected_result)

    s = "aa"
    p = ".*"
    expected_result = true
    is_match(s, p).must_equal(expected_result)

    s = "ab"
    p = ".*"
    expected_result = true
    is_match(s, p).must_equal(expected_result)

    s = "aab"
    p = "c*a*b"
    expected_result = true
    is_match(s, p).must_equal(expected_result)

    s = "ab"
    p = ".*.."
    expected_result = true
    is_match(s, p).must_equal(expected_result)

    s = "aa"
    p = "a"
    expected_result = false
    is_match(s, p).must_equal(expected_result)
  end

  it 'should work2' do
    s = "aaa"
    p = "ab*ac*a"
    expected_result = true
    is_match(s, p).must_equal(expected_result)
  end
end
