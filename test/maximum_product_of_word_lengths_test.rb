require 'minitest/autorun'
require '../maximum_product_of_word_lengths'

describe 'bit_map(str)' do
  it 'should work' do
    s = "a"
    expected_result = 1
    bit_map(s).must_equal(expected_result)

    s = "ab"
    expected_result = 3
    bit_map(s).must_equal(expected_result)

    s = "e"
    expected_result = 16
    bit_map(s).must_equal(expected_result)
  end
end

describe 'max_product(words)' do
  it 'should work1' do
    words = ["abcw", "baz", "foo", "bar", "xtfn", "abcdef"]
    expected_result = 16
    max_product(words).must_equal(expected_result)

    words = ["a", "ab", "abc", "d", "cd", "bcd", "abcd"]
    expected_result = 4
    max_product(words).must_equal(expected_result)

    words = ["a", "aa", "aaa", "aaaa"]
    expected_result = 0
    max_product(words).must_equal(expected_result)
  end
end
