require 'minitest/autorun'
require '../sudoku_solver'

describe 'solve_sudoku(board)' do
  it 'should work1' do
    board = [
      "53..7....",
      "6..195...",
      ".98....6.",
      "8...6...3",
      "4..8.3..1",
      "7...2...6",
      ".6....28.",
      "...419..5",
      "....8..79",
    ].map do |str|
      str.chars
    end

    expected_result = [
      "534678912",
      "672195348",
      "198342567",
      "859761423",
      "426853791",
      "713924856",
      "961537284",
      "287419635",
      "345286179",
    ].map do |str|
      str.chars
    end

    solve_sudoku(board)
    board.must_equal(expected_result)
  end

  it 'should work2' do
    board = ["..9748...","7........",".2.1.9...","..7...24.",".64.1.59.",".98...3..","...8.3.2.","........6","...2759.."].map do |str|
      str.chars
    end

    expected_result = ["519748632","783652419","426139875","357986241","264317598","198524367","975863124","832491756","641275983"].map do |str|
      str.chars
    end

    solve_sudoku(board)
    board.must_equal(expected_result)
  end
end
