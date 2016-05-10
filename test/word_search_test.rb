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

  it 'should work4' do
    board = [
      "CAA",
      "AAA",
      "BCD"].map do |str|
      str.chars
    end

    word = "AAB"
    expected_result = true
    exist(board, word).must_equal(expected_result)
  end

  it 'should work5' do
    board = ["ABCE",
             "SFES",
             "ADEE"].map do |str|
      str.chars
    end

    word = "ABCESEEEFS"
    expected_result = true
    exist(board, word).must_equal(expected_result)

    board = [
      "aaaa",
      "aaaa",
      "aaaa",
      "aaaa",
      "aaab"
    ].map do |str|
      str.chars
    end
    word = "aaaaaaaaaaaaaaaaaaaa"
    expected_result = false
    exist(board, word).must_equal(expected_result)
  end
end
