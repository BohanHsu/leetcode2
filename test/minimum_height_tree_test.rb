require 'minitest/autorun'
require '../minimum_height_tree'

describe 'find_min_height_trees(n, edges)' do
  it 'should pass given test case' do
    n = 4
    edges = [[1, 0], [1, 2], [1, 3]]
    expected_result = [1]
    find_min_height_trees(n, edges).sort.must_equal(expected_result)

    n = 6
    edges = [[0, 3], [1, 3], [2, 3], [4, 3], [5, 4]]
    expected_result = [3, 4]
    find_min_height_trees(n, edges).sort.must_equal(expected_result)
  end

  it 'should handle corner case' do
    n = 1
    edges = []
    expected_result = [0]
    find_min_height_trees(n, edges).sort.must_equal(expected_result)

    n = 2
    edges = [[0,1]]
    expected_result = [0,1]
    find_min_height_trees(n, edges).sort.must_equal(expected_result)
  end
end
