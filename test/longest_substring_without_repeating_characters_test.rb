require 'minitest/autorun'
require '../longest_substring_without_repeating_characters'

describe 'length_of_longest_substring(s)' do
  it 'should work1' do
    s = "abcabcbb"
    expected_result = 3
    length_of_longest_substring(s).must_equal(expected_result)

    s = "bbbbb"
    expected_result = 1
    length_of_longest_substring(s).must_equal(expected_result)

    s = "pwwkew"
    expected_result = 3
    length_of_longest_substring(s).must_equal(expected_result)

    s = ""
    expected_result = 0
    length_of_longest_substring(s).must_equal(expected_result)

    s = "c"
    expected_result = 1
    length_of_longest_substring(s).must_equal(expected_result)
  end

  it 'should work2' do
    s = "abba"
    expected_result = 2
    length_of_longest_substring(s).must_equal(expected_result)
  end
end
