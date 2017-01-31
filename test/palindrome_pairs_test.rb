require 'minitest/autorun'
require '../palindrome_pairs'

describe 'palindrome_pairs(words)' do
  it 'should work1' do
    words = ["bat", "tab", "cat"]
    expected_result = [[0, 1], [1, 0]]
    actual_result = palindrome_pairs(words).sort
    actual_result.must_equal(expected_result.sort)

    words = ["abcd", "dcba", "lls", "s", "sssll"]
    expected_result = [[0, 1], [1, 0], [3, 2], [2, 4]]
    actual_result = palindrome_pairs(words).sort
    actual_result.must_equal(expected_result.sort)

    words = ["a","abc","aba",""]
    expected_result = [[0,3],[3,0],[2,3],[3,2]]
    actual_result = palindrome_pairs(words).sort
    actual_result.must_equal(expected_result.sort)
  end
end
