require 'minitest/autorun'
require '../word_pattern'

describe 'word_pattern(pattern, str)' do
  it 'should work1' do
    pattern = "abba"
    str = "dog cat cat dog"
    expected_result = true
    word_pattern(pattern, str).must_equal(expected_result)

    pattern = "abba"
    str = "dog cat cat fish"
    expected_result = false
    word_pattern(pattern, str).must_equal(expected_result)

    pattern = "aaaa"
    str = "dog cat cat dog"
    expected_result = false
    word_pattern(pattern, str).must_equal(expected_result)

    pattern = "abba"
    str = "dog dog dog dog"
    expected_result = false
    word_pattern(pattern, str).must_equal(expected_result)
  end
end
