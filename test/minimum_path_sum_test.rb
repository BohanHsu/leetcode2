require 'minitest/autorun'
require '../minimum_path_sum'

describe 'min_path_sum(grid)' do
  it 'should work1' do
    grid = [
      [1,1,1,4,5,6,7],
      [1,2,1,4,5,6,7],
      [1,2,1,1,1,1,7],
      [1,2,3,4,5,1,1]
    ]
    expected_result = 10
    min_path_sum(grid).must_equal(expected_result)
  end
end
