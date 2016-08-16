require 'minitest/autorun'
require '../edit_distance'

describe 'min_distance(word1, word2)' do
  it 'should work1' do
    word1 = "12345"
    word2 = "135"
    expected_result = 2
    min_distance(word1, word2).must_equal(expected_result)

    word1 = "12345"
    word2 = "123445"
    expected_result = 1
    min_distance(word1, word2).must_equal(expected_result)

    word1 = "12345"
    word2 = ""
    expected_result = 5
    min_distance(word1, word2).must_equal(expected_result)

    word1 = "1"
    word2 = "2"
    expected_result = 1
    min_distance(word1, word2).must_equal(expected_result)
  end
end
