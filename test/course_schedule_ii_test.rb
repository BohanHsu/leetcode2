require 'minitest/autorun'
require '../course_schedule_ii'

describe 'find_order(num_courses, prerequisites)' do
  it 'should work1' do
    num_courses, prerequisites, expected_result = [2, [[1,0]], [0,1]]
    find_order(num_courses, prerequisites).must_equal(expected_result)

    num_courses, prerequisites, expected_result = [3, [[1,0], [0,1], [2,1]], []]
    find_order(num_courses, prerequisites).must_equal(expected_result)

    num_courses, prerequisites, expected_result = [2, [[1,0], [0,1]], []]
    find_order(num_courses, prerequisites).must_equal(expected_result)

    num_courses, prerequisites, expected_result = [4, [[1,0],[2,0],[3,1],[3,2]], [0,2,1,3]]
    find_order(num_courses, prerequisites).must_equal(expected_result)
    
    num_courses, prerequisites, expected_result = [2, [[0,1]], [1,0]]
    find_order(num_courses, prerequisites).must_equal(expected_result)

  end

  #it 'should work2' do
  #  num_courses, prerequisites, expected_result = [10, [[1,0], [2,3], [3,4]], true]
  #  find_order(num_courses, prerequisites).must_equal(expected_result)
  #end

  #it 'should work3' do
  #  num_courses, prerequisites, expected_result = [10, [[1,0], [2,3], [3,4], [8,9],[9,8]], []]
  #  find_order(num_courses, prerequisites).must_equal(expected_result)
  #end
end
