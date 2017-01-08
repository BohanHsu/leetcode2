require 'minitest/autorun'
require '../valid_sudoku'

describe 'is_valid_sudoku(board)' do
  it 'should work1' do
    board = [".87654321","2........","3........","4........","5........","6........","7........","8........","9........"]
    expected_result = true

    is_valid_sudoku(board).must_equal(expected_result)
  end
end
