require 'minitest/autorun'
require '../number_of_islands'

describe 'num_islands(grid)' do
  it 'should work1' do
    grid = [
      "11110".chars,
      "11010".chars,
      "11000".chars,
      "00000".chars
    ]
    expected_result = 1
    num_islands(grid).must_equal(expected_result)

    grid = [
      "11000".chars,
      "11000".chars,
      "00100".chars,
      "00011".chars,
    ]
    expected_result = 3
    num_islands(grid).must_equal(expected_result)
  end
end
