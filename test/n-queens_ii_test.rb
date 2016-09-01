require 'minitest/autorun'
require '../n-queens_ii'

describe 'total_n_queens(n)' do
  it 'should work1' do
    n = 4
    expected_result = 2
    total_n_queens(n).must_equal(expected_result)
  end
end
