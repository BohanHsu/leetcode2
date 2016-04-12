require 'minitest/autorun'
require '../search_a_2d_matrix'

describe 'search_matrix(matrix, target)' do
  it 'should work1' do
    matrix = [
      [1,5],
      [10,15]
    ]
    target = 1
    expected_result = true
    search_matrix(matrix, target).must_equal(expected_result)

    target = 10
    expected_result = true
    search_matrix(matrix, target).must_equal(expected_result)

    target = 5
    expected_result = true
    search_matrix(matrix, target).must_equal(expected_result)

    target = 15
    expected_result = true
    search_matrix(matrix, target).must_equal(expected_result)
  end

  it 'should work2' do
    matrix = [
      [1,5],
      [10,15]
    ]

    target = -1
    expected_result = false
    search_matrix(matrix, target).must_equal(expected_result)

    target = 100
    expected_result = false
    search_matrix(matrix, target).must_equal(expected_result)

    target = 3
    expected_result = false
    search_matrix(matrix, target).must_equal(expected_result)

    target = 13
    expected_result = false
    search_matrix(matrix, target).must_equal(expected_result)
  end

  it 'should work3' do
    matrix = [
      [1, 3, 5, 7],
      [10, 11, 16, 20],
      [23, 30, 34, 50]
    ]

    exists = matrix.inject do |memo, obj|
      memo + obj
    end
    ((exists[0] - 1)..(exists[-1] + 1)).each do |i|
      search_matrix(matrix, i).must_equal(!exists.find_index(i).nil?)
    end
  end

  it 'should work4' do
    matrix = [[]]

    [1,2,3,4].each do |i|
      search_matrix(matrix, i).must_equal(false)
    end
  end
end
