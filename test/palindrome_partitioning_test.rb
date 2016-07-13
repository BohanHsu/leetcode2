require 'minitest/autorun'
require '../palindrome_partitioning'

describe 'is_palindrome(s)' do
  it 'should work1' do
    s = ''
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = 'a'
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = 'aa'
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = 'aaa'
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = 'aaaa'
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = 'baab'
    expected_result = true
    is_palindrome(s).must_equal(expected_result)

    s = 'ab'
    expected_result = false
    is_palindrome(s).must_equal(expected_result)

    s = 'abb'
    expected_result = false
    is_palindrome(s).must_equal(expected_result)

    s = 'abbb'
    expected_result = false
    is_palindrome(s).must_equal(expected_result)

    s = 'babb'
    expected_result = false
    is_palindrome(s).must_equal(expected_result)
  end
end

describe 'partition(s)' do
  it 'should work2' do
    s = 'aab'
    expected_result = [
      ["aa","b"],
      ["a","a","b"]
    ]
    partition(s).sort.must_equal(expected_result.sort)
  end
end
