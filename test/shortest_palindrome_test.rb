require 'minitest/autorun'
require '../shortest_palindrome'

describe 'shortest_palindrome(s)' do
  it 'should work1' do
    s = "aacecaaa"
    expected_result = "aaacecaaa"
    shortest_palindrome(s).must_equal(expected_result)

    s = "abcd"
    expected_result = "dcbabcd"
    shortest_palindrome(s).must_equal(expected_result)

    s = "abccba"
    expected_result = "abccba"
    shortest_palindrome(s).must_equal(expected_result)

    s = "abcba"
    expected_result = "abcba"
    shortest_palindrome(s).must_equal(expected_result)

    s = "a"
    expected_result = "a"
    shortest_palindrome(s).must_equal(expected_result)

    s = ""
    expected_result = ""
    shortest_palindrome(s).must_equal(expected_result)

    s = "abccbad"
    expected_result = "dabccbad"
    shortest_palindrome(s).must_equal(expected_result)

    s = "abcbad"
    expected_result = "dabcbad"
    shortest_palindrome(s).must_equal(expected_result)
  end

  it 'should work2' do
    s = "babbbabbaba"
    expected_result = "ababbabbbabbaba"
    shortest_palindrome(s).must_equal(expected_result)
  end

  it 'should work3' do
    s = "abbabaab"
    expected_result = "baababbabaab"
    shortest_palindrome(s).must_equal(expected_result)
  end
end
