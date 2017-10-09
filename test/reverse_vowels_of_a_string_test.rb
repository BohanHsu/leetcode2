require 'minitest/autorun'
require '../reverse_vowels_of_a_string'

describe 'reverse_vowels(s)' do
  it 'should work1' do
    s = "hello"
    expected_result = "holle"
    reverse_vowels(s).must_equal(expected_result)

    s = "leetcode"
    expected_result = "leotcede"
    reverse_vowels(s).must_equal(expected_result)

    s = "abc"
    expected_result = "abc"
    reverse_vowels(s).must_equal(expected_result)

    s = "aA"
    expected_result = "Aa"
    reverse_vowels(s).must_equal(expected_result)
  end
end
