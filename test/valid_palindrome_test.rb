require 'minitest/autorun'
require '../valid_palindrome'

describe 'is_palindrome(s)' do
  it 'should work1' do
    s = "A man, a plan, a canal: Panama"
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = "race a car"
    expected_result = false
    is_palindrome(s).must_equal(expected_result)

    s = "!!!"
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = "a."
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = ".a"
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = ".a."
    expected_result = true
    is_palindrome(s).must_equal(expected_result)
  end

  it 'should work2' do
    s = "0a"
    expected_result = false
    is_palindrome(s).must_equal(expected_result)
  end
end
