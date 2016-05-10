require 'minitest/autorun'
require '../word_search'

describe 'exist(board, word)' do
  it 'should work1' do
    board = [
      ['A','B','C','E'],
      ['S','F','C','S'],
      ['A','D','E','E']
    ]

    word = "ABCCED"
    expected_result = true
    exist(board, word).must_equal(expected_result)

    word = "ABCB"
    expected_result = false
    exist(board, word).must_equal(expected_result)
  end

  it 'should work2' do
    board = [
      ['A','B','C','E'],
      ['S','F','C','S'],
      ['A','D','E','E']
    ]

    word = "SEE"
    expected_result = true
    exist(board, word).must_equal(expected_result)
  end

  it 'should work3' do
    board = []
    word = "SEE"
    expected_result = false
    exist(board, word).must_equal(expected_result)

    board = [[]]
    word = "SEE"
    expected_result = false
    exist(board, word).must_equal(expected_result)

    board = [[]]
    word = ""
    expected_result = true
    exist(board, word).must_equal(expected_result)
  end
end
