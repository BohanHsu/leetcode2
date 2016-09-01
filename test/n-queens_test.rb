require 'minitest/autorun'
require '../n-queens'

describe 'solve_n_queens(n)' do
  it 'should work1' do
    n = 4
    expected_result = [
      [
        ".Q..",
        "...Q",
        "Q...",
        "..Q."
      ],

      [
        "..Q.",
        "Q...",
        "...Q",
        ".Q.."
      ]
    ].sort
    solve_n_queens(n).sort.must_equal(expected_result)

    n = 2
    expected_result = []
    solve_n_queens(n).sort.must_equal(expected_result)
  end
end
