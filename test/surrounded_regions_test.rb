require 'minitest/autorun'
require '../surrounded_regions'

describe 'solve(board)' do
  it 'should work1' do
    board = [
      "XXXX",
      "XOOX",
      "XXOX",
      "XOXX"
    ]
    expected_result = [
      "XXXX",
      "XXXX",
      "XXXX",
      "XOXX"
    ]
    solve(board)
    board.must_equal(expected_result)
  end
end
