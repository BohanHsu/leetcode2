require 'minitest/autorun'
require '../max_points_on_a_line'

describe 'max_points(points)' do
  it 'should work1' do
    array = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5]]
    points = convert_array_to_points(array)
    expected_result = 5
    max_points(points).must_equal(expected_result)

    array = [[0, 0], [2, 4], [4, 8], [6, 12], [8, 16]]
    points = convert_array_to_points(array)
    expected_result = 5
    max_points(points).must_equal(expected_result)

    array = [[0, 1], [2, 2], [4, 3], [6, 4], [8, 4]]
    points = convert_array_to_points(array)
    expected_result = 4
    max_points(points).must_equal(expected_result)

    array = [[1, 1], [2, 1], [4, 1], [6, 1], [8, 1]]
    points = convert_array_to_points(array)
    expected_result = 5
    max_points(points).must_equal(expected_result)

    array = []
    points = convert_array_to_points(array)
    expected_result = 0
    max_points(points).must_equal(expected_result)

    array = [[1, 1]]
    points = convert_array_to_points(array)
    expected_result = 1
    max_points(points).must_equal(expected_result)

    array = [[1,1],[1,1],[2,3]]
    points = convert_array_to_points(array)
    expected_result = 3
    max_points(points).must_equal(expected_result)

    array = [[1,1],[1,1],[1,3]]
    points = convert_array_to_points(array)
    expected_result = 3
    max_points(points).must_equal(expected_result)
  end

  it 'should work2' do
    array = [[3,1],[12,3],[3,1],[-6,-1]]
    points = convert_array_to_points(array)
    expected_result = 4
    max_points(points).must_equal(expected_result)

    array = [[0, 0], [0, 0], [0, 0]]
    points = convert_array_to_points(array)
    expected_result = 3
    max_points(points).must_equal(expected_result)
  end
end

def convert_array_to_points(array)
  return array.map do |pair|
    Point.new(pair[0], pair[1])
  end
end
