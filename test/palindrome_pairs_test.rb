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

  it 'should work3' do
    words = ["a","b","c","ab","ac","aa"]
    expected_result = [[3,0],[1,3],[4,0],[2,4],[5,0],[0,5]]
    actual_result = palindrome_pairs(words).sort
    actual_result.must_equal(expected_result.sort)
  end
end

#describe 'compare_pair' do
#  it 'should work2' do
#    check_existence = {}
#    result = []
#    root = {}
#    palindromes = {}
#
#    words = ["a", ""]
#    i = 0
#    j = 1
#
#    compare_pair(words, i, j, result, check_existence, palindromes)
#    result.size.must_equal(2)
#  end
#end
