require 'minitest/autorun'
require '../surrounded_regions'

describe 'solve(board)' do
  it 'should work1' do
    board = [
      "XXXX".chars,
      "XOOX".chars,
      "XXOX".chars,
      "XOXX".chars
    ]
    expected_result = [
      "XXXX".chars,
      "XXXX".chars,
      "XXXX".chars,
      "XOXX".chars
    ]
    solve(board)
    board.must_equal(expected_result)
  end
end
