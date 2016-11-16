require 'minitest/autorun'
require '../palindrome_number'

describe 'is_palindrome(x)' do
  it 'should work1' do
    x = 1
    expected_result = true
    is_palindrome(x).must_equal(expected_result)

    x = 101
    expected_result = true
    is_palindrome(x).must_equal(expected_result)

    x = 111101111
    expected_result = true
    is_palindrome(x).must_equal(expected_result)

    x = 1111221111
    expected_result = true
    is_palindrome(x).must_equal(expected_result)

    x = -1111221111
    expected_result = false
    is_palindrome(x).must_equal(expected_result)

    x = 112101111
    expected_result = false
    is_palindrome(x).must_equal(expected_result)
  end

  it 'should work2' do
    x = 1000021
    expected_result = false
    is_palindrome(x).must_equal(expected_result)
  end
end
