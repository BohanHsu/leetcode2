require 'minitest/autorun'
require '../longest_palindromic_substring'

describe 'longest_palindrome(s)' do
  it 'should work1' do
    s = "afl;afabbbaf8qerrupqteq"
    expected_result = "fabbbaf"
    longest_palindrome(s).must_equal(expected_result)

    s = "afl;afabbbbaf8qerrupqteq"
    expected_result = "fabbbbaf"
    longest_palindrome(s).must_equal(expected_result)

    s = "123456788"
    expected_result = "88"
    longest_palindrome(s).must_equal(expected_result)
  end
end
