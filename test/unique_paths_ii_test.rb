require 'minitest/autorun'
require '../unique_paths_ii'

describe 'unique_paths_with_obstacles(obstacle_grid)' do
  it 'should work1' do
    obstacle_grid = [
      [0,0,0],
      [0,1,0],
      [0,0,0]
    ]
    expected_result = 2
    unique_paths_with_obstacles(obstacle_grid).must_equal(expected_result)

    obstacle_grid = [[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[1,0],[0,0],[0,0],[0,0],[0,0],[0,0],[1,0],[0,0],[0,0],[0,0],[0,0],[0,1],[0,0],[0,0],[1,0],[0,0],[0,0],[0,1],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,1],[0,0],[0,0],[0,0],[0,0],[1,0],[0,0],[0,0],[0,0],[0,0]]
    expected_result = 9
    #unique_paths_with_obstacles(obstacle_grid).must_equal(expected_result)

    obstacle_grid = [
      [1]
    ]
    expected_result = 0
    unique_paths_with_obstacles(obstacle_grid).must_equal(expected_result)

    obstacle_grid = [
      [0],
      [1]
    ]
    expected_result = 0
    unique_paths_with_obstacles(obstacle_grid).must_equal(expected_result)
  end

  it 'should work2' do
    obstacle_grid = [
      [1], 
      [0]
    ]
    expected_result = 0
    unique_paths_with_obstacles(obstacle_grid).must_equal(expected_result)
  end
end
